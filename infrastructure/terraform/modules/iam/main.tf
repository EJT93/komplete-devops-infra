resource "aws_iam_role" "eks_cluster_role" {
  name               = var.role_name
  assume_role_policy = var.assume_role_policy
}

resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  role       = aws_iam_role.eks_cluster_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_instance_profile" "eks_access_role_instance_profile" {
  name = var.eks_access_role_instance_profile_name
  role = var.eks_access_role_instance_profile_role
}