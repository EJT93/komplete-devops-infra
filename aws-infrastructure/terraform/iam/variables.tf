variable "role_name" {
  description = "eksClusterRole"
  type        = string
}

variable "assume_role_policy" {
  description = "The policy that grants an entity permission to assume the role"
  type        = string
}

variable "eks_access_role_instance_profile_name" {}
variable "eks_access_role_instance_profile_role" {}