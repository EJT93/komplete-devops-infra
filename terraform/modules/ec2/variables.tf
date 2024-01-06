variable "region" {}
variable "key_name" {}

variable "sg_rule_type" {}
variable "sg_protocol" {}

variable "sg_ssh_port" {}

variable "sg_http_port" {}
variable "sg_http_desc" {}

variable "sg_https_port" {}
variable "sg_https_desc" {}

variable "jenkins_port" {}

variable "github_key" {}
variable "instance_type" {}
variable "assoc_pub_ip" {}
variable "my-vpc_name" {}
variable "my-vpc-subnet_name" {}
variable "my-vpc-sg_name" {}
variable "private_ip" {}
variable "volume_type" {}
variable "volume_size" {}
variable "delete_on_termination" {}
variable "instance_name" {
  default = "Bastion-Host"
}
variable "eks_access_role_instance_profile_name" {
  default = "EKS-Access-Role-Instance-Profile" 
}
variable "eks_access_role_instance_profile_role" {
  default = "EKS-Access-Role"
}

variable "public_key_path" {
  type = string
}
variable "private_key_path" {
  type = string
}