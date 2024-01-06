# data.tf
data "terraform_remote_state" "vpc" {
  backend                 = "s3"
  config  = {
    bucket                = "elijah-terraform-state"
    key                   = "komplete-devops-vpc/terraform.tfstate"
    region                = "us-east-2"
  }
}

data "aws_eks_cluster_auth" "eks" {
  name = aws_eks_cluster.eks.name
}

provider "kubernetes" {
  host                   = aws_eks_cluster.eks.endpoint
  token                  = data.aws_eks_cluster_auth.eks.token
  cluster_ca_certificate = base64decode(aws_eks_cluster.eks.certificate_authority[0].data)
}


