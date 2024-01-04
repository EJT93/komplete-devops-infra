# main.tf
module "et-eks" {
  source                    = "../../modules/eks"

  region                    = var.region
  frontend_node_group_name  = var.frontend_node_group_name
  backend_node_group_name   = var.backend_node_group_name
  capacity_type             =  var.capacity_type
  disk_size                 = var.disk_size
  instance_types            = var.instance_types
#  ec2_ssh_key  = var.ec2_ssh_key
  key_name                  = var.key_name
  public_key_path           = var.public_key_path
  desired_size              = var.desired_size
  max_size                  = var.max_size
  min_size                  = var.min_size
  max_unavailable           = var.max_unavailable
  eks_cluster_name          = var.eks_cluster_name
  eks_cluster_version       = var.eks_cluster_version
  s3_bucket                 = var.s3_bucket
  bucket_force_destroy      = var.bucket_force_destroy

}