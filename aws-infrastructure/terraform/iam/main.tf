module "iam" {
  source = "../modules/iam"

  eks_access_role_instance_profile_name = var.eks_access_role_instance_profile_name
  eks_access_role_instance_profile_role = var.eks_access_role_instance_profile_role
  role_name                             = var.role_name
  assume_role_policy                    = var.assume_role_policy
}