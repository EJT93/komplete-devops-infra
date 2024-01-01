module "vpc" {
  source                          = "../modules/vpc"

  region                          = var.region
  vpc_name                        = var.vpc_name
  vpc_cidr                        = var.vpc_cidr
  enable_dns_support              = var.enable_dns_support
  enable_dns_hostnames            = var.enable_dns_hostnames
  pub-sub_map_public_ip           = var.pub-sub_map_public_ip
  pri-sub_map_public_ip           = var.pri-sub_map_public_ip

  pub-sub1_name                   = var.pub-sub1_name
  pub-sub1_cidr                   = var.pub-sub1_cidr
  pub-sub1_az                     = var.pub-sub1_az

  pub-sub2_name                   = var.pub-sub2_name
  pub-sub2_cidr                   = var.pub-sub2_cidr
  pub-sub2_az                     = var.pub-sub2_az

  pub-sub3_name                   = var.pub-sub3_name
  pub-sub3_cidr                   = var.pub-sub3_cidr
  pub-sub3_az                     = var.pub-sub3_az

  pri-sub1_name                   = var.pri-sub1_name
  pri-sub1_cidr                   = var.pri-sub1_cidr
  pri-sub1_az                     = var.pri-sub1_az

  pri-sub2_name                   = var.pri-sub2_name
  pri-sub2_cidr                   = var.pri-sub2_cidr
  pri-sub2_az                     = var.pri-sub2_az

  pri-sub3_name                   = var.pri-sub3_name
  pri-sub3_cidr                   = var.pri-sub3_cidr
  pri-sub3_az                     = var.pri-sub3_az

  igw_name                        = var.igw_name

  pub-rt_name                     = var.pub-rt_name
  pub-rt_cidr                     = var.pub-rt_cidr

  pri-rt_name                     = var.pri-rt_name
  pri-rt_cidr                     = var.pri-rt_cidr

  myip                            = var.myip
  myip_work                       = var.myip_work
  testing_ip                      = var.testing_ip 

  main-vpc-sg_name                = var.main-vpc-sg_name
  main-vpc-sg_desc                = var.main-vpc-sg_desc
  main-vpc-sg_from_port           = var.main-vpc-sg_from_port
  main-vpc-sg_to_port             = var.main-vpc-sg_to_port
  main-vpc-sg_protocol            = var.main-vpc-sg_protocol
  main-vpc-sg_cidr                = var.main-vpc-sg_cidr
  main-vpc_name                   = var.main-vpc_name

  sg_rule_type                    = var.sg_rule_type 
  sg_rule_ssh_port                = var.sg_rule_ssh_port
  sg_rule_http_port               = var.sg_rule_http_port
  sg_rule_https_port              = var.sg_rule_https_port
  sg_rule_jenkins_port            = var.sg_rule_jenkins_port
  sg_protocol                     = var.sg_protocol
  sg_cidr                         = var.sg_cidr
  role_name                       = var.role_name

  sg_ssh_myip_desc                = var.sg_ssh_myip_desc
  sg_ssh_desc                     = var.sg_ssh_desc
  sg_http_desc                    = var.sg_http_desc
  sg_http_jenkins_desc            = var.sg_http_jenkins_desc
  sg_https_desc                   = var.sg_https_desc

}



# module "cluster-role" {
#   source                         = "./modules/iam"

#   role_name = var.role_name
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Effect = "Allow",
#         Principal = {
#           Service = "eks.amazonaws.com"
#         },
#         Action = "sts:AssumeRole"
#       }
#     ]
#   })
# }

