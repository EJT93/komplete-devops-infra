# varibles.tf 
variable "region" {}
variable "instance_type" {}
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
variable "public_key_path" {}
variable "private_key_path" {}
variable "assoc_pub_ip" {}
variable "my-vpc_name" {}
variable "my-vpc-subnet_name" {}
variable "my-vpc-sg_name" {}
variable "volume_type" {}
variable "volume_size" {}
variable "delete_on_termination" {}
variable "instance_name" {}
variable "private_ip" {}
variable "eks_access_role_instance_profile_name" {}
variable "eks_access_role_instance_profile_role" {}