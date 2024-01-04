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