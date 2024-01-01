# main.tf
module "bastion-host" {
  source                                = "../modules/ec2"
  
  region                                = var.region
  key_name                              = var.key_name
  instance_type                         = var.instance_type
  assoc_pub_ip                          = var.assoc_pub_ip
  ami                                   = var.ami

  my-vpc_name                           = var.my-vpc_name
  my-vpc-subnet_name                    = var.my-vpc-subnet_name
  my-vpc-sg_name                        = var.my-vpc-sg_name
  private_ip                            = var.private_ip

  volume_type                           = var.volume_type
  volume_size                           = var.volume_size
  delete_on_termination                 = var.delete_on_termination
  instance_name                         = var.instance_name

  # eks_access_role_instance_profile_name = var.eks_access_role_instance_profile_name
  # eks_access_role_instance_profile_role = var.eks_access_role_instance_profile_role
}