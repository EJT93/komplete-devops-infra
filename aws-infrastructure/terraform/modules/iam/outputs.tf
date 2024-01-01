output "eks_access_role_instance_profile_arn" {
  value       = aws_iam_instance_profile.eks_access_role_instance_profile.arn
  description = "ARN of the EKS access role instance profile"
}
