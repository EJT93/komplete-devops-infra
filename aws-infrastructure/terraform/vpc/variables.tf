variable "region" {}

variable "vpc_cidr" {}
variable "enable_dns_support" {}
variable "enable_dns_hostnames" {}
variable "vpc_name" {}

variable "pub-sub_map_public_ip" {}
variable "pri-sub_map_public_ip" {}

variable "pub-sub1_name" {}
variable "pub-sub1_cidr" {}
variable "pub-sub1_az" {}
variable "pub-sub2_name" {}
variable "pub-sub2_cidr" {}
variable "pub-sub2_az" {}
variable "pub-sub3_name" {}
variable "pub-sub3_cidr" {}
variable "pub-sub3_az" {}
variable "pri-sub1_name" {}
variable "pri-sub1_cidr" {}
variable "pri-sub1_az" {}
variable "pri-sub2_name" {}
variable "pri-sub2_cidr" {}
variable "pri-sub2_az" {}
variable "pri-sub3_name" {}
variable "pri-sub3_cidr" {}
variable "pri-sub3_az" {}

variable "igw_name" {}

variable "pub-rt_name" {}
variable "pub-rt_cidr" {}
variable "pri-rt_name" {}
variable "pri-rt_cidr" {}

variable "myip" {}
variable "myip_work" {}
variable "testing_ip" {}

variable "main-vpc-sg_name" {}
variable "main-vpc-sg_desc" {}
variable "main-vpc-sg_from_port" {}
variable "main-vpc-sg_to_port" {}
variable "main-vpc-sg_protocol" {}
variable "main-vpc-sg_cidr" {}
variable "main-vpc_name" {}

variable "sg_rule_type" {}
variable "sg_rule_ssh_port" {}
variable "sg_rule_http_port" {}
variable "sg_rule_https_port" {}
variable "sg_rule_jenkins_port" {}
variable "sg_protocol" {}

variable "sg_cidr" {}

variable "sg_ssh_myip_desc" {}
variable "sg_ssh_desc" {}
variable "sg_http_desc" {}
variable "sg_http_jenkins_desc" {}
variable "sg_https_desc" {}

variable "role_name" {}