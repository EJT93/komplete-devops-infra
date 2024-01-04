# main.tf
module "bastion-host" {
  source                                = "../../modules/ec2"
  
  region                                = var.region
  key_name                              = var.key_name
  
  sg_rule_type                          = var.sg_rule_type
  sg_protocol                           = var.sg_protocol

  jenkins_port                          = var.jenkins_port
  sg_ssh_port                           = var.sg_ssh_port
  sg_http_port                          = var.sg_http_port
  sg_https_port                         = var.sg_https_port
  
  sg_http_desc                          = var.sg_http_desc
  sg_https_desc                         = var.sg_https_desc

  github_key                            = var.github_key
  public_key_path                       = var.public_key_path
  private_key_path                      = var.private_key_path
  instance_type                         = var.instance_type
  assoc_pub_ip                          = var.assoc_pub_ip

  my-vpc_name                           = var.my-vpc_name
  my-vpc-subnet_name                    = var.my-vpc-subnet_name
  my-vpc-sg_name                        = var.my-vpc-sg_name
  private_ip                            = var.private_ip

  volume_type                           = var.volume_type
  volume_size                           = var.volume_size
  delete_on_termination                 = var.delete_on_termination
  instance_name                         = var.instance_name

  eks_access_role_instance_profile_name = var.eks_access_role_instance_profile_name
  eks_access_role_instance_profile_role = var.eks_access_role_instance_profile_role
}