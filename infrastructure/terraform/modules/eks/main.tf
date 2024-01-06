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
