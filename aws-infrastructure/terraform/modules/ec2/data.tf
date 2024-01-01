data "aws_vpc" "my-vpc" {
  filter {
    name   = "tag:Name"
    values                = [var.my-vpc_name]
  }
}

data "aws_subnet" "my-vpc-subnet" {
  filter {
    name                  = "tag:Name"
    values                = [var.my-vpc-subnet_name]
  }
}

data "aws_security_group" "my-vpc-sg" {
  vpc_id                  = data.aws_vpc.my-vpc.id

  filter {
    name                  = "tag:Name"
    values                = [var.my-vpc-sg_name]
  }
}

data "terraform_remote_state" "aws-infra" {
  backend                 = "s3"
  config  = {
    bucket                = "elijah-terraform-state"
    key                   = "komplete-devops-vpc/terraform.tfstate"
    region                = "us-east-2"
  }
}

# Grab the most recent AL2023 image
data "aws_ami" "server_ami" {
	most_recent             = true
	owners                  = ["137112412989"]

	filter {
		name                  = "name"
		values                = ["al2023-ami-2023.3*kernel-6.1-x86_64"]
	}
}