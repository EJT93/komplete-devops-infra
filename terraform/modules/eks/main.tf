# eks.tf

resource "aws_eks_cluster" "eks" {
  name      = var.eks_cluster_name
  version   = var.eks_cluster_version
  role_arn  = aws_iam_role.master.arn

  vpc_config {
    subnet_ids = [
      data.terraform_remote_state.vpc.outputs.public_subnet1_id,
      data.terraform_remote_state.vpc.outputs.public_subnet2_id
      ]
  }
  
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.AmazonEKSServicePolicy,
    aws_iam_role_policy_attachment.AmazonEKSVPCResourceController,
    aws_iam_role_policy_attachment.AmazonEKSVPCResourceController,
    data.terraform_remote_state.vpc
  ]

}

# data "aws_eks_cluster" "eks" {
#   name = var.eks_cluster_name
# }
data "aws_eks_cluster_auth" "eks" {
  name = aws_eks_cluster.eks.name
}


data "terraform_remote_state" "vpc" {
  backend                 = "s3"
  config  = {
    bucket                = "elijah-terraform-state"
    key                   = "komplete-devops-vpc/terraform.tfstate"
    region                = "us-east-2"
  }
}

data "tls_certificate" "cluster" {
  url = aws_eks_cluster.eks.identity.0.oidc.0.issuer
}
resource "aws_iam_openid_connect_provider" "oidc_provider" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.cluster.certificates.0.sha1_fingerprint]
  url             = aws_eks_cluster.eks.identity[0].oidc[0].issuer
}

provider "kubernetes" {
  host                   = aws_eks_cluster.eks.endpoint
  token                  = data.aws_eks_cluster_auth.eks.token
  cluster_ca_certificate = base64decode(aws_eks_cluster.eks.certificate_authority[0].data)
}

resource "kubernetes_service_account" "ebs_csi_driver" {
  metadata {
    name      = "ebs-csi-driver"
    namespace = "kube-system"
    annotations = {
      "eks.amazonaws.com/role-arn" = aws_iam_role.ebs_csi_driver.arn
    }
  }
}

# Ensure that the aws-auth ConfigMap is configured correctly, granting the necessary access to the EKS-Access-Role and eksUser
resource "kubernetes_config_map" "aws_auth" {
  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
  }

  data = {
    mapRoles = <<-YAML
      - rolearn: ${aws_iam_role.worker.arn}
        username: system:node:{{EC2PrivateDNSName}}
        groups:
          - system:bootstrappers
          - system:nodes
      - rolearn: arn:aws:iam::290481657399:role/EKS-Access-Role
        username: eks-access-role
        groups:
          - system:masters
    YAML

    mapUsers = <<-YAML
      - userarn: arn:aws:iam::290481657399:user/eksUser
        username: eksUser
        groups:
          - system:masters
    YAML
  }
}
