# variables.tf
variable "region" {}
variable "frontend_node_group_name" {}
variable "backend_node_group_name" {}
variable "capacity_type" {}
variable "disk_size" {}
variable "instance_types" {}
variable "public_key_path" {}
variable "key_name" {}
variable "desired_size" {}
variable "max_size" {}
variable "min_size" {}
variable "max_unavailable" {}
variable "eks_cluster_name" {}
variable "eks_cluster_version" {}
variable "s3_bucket" {}
variable "bucket_force_destroy" {}