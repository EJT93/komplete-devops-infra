variable "region" {}
variable "key_name" {}
variable "jenkins_type" {}
variable "jenkins_port" {}
variable "jenkins_protocol" {}
variable "cidr_blocks" {
  type = list
}
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
variable "instance_name" {}
variable "eks_access_role_instance_profile_name" {}
variable "eks_access_role_instance_profile_role" {}

variable "public_key_path" {
  type = string
}
variable "private_key_path" {
  type = string
}