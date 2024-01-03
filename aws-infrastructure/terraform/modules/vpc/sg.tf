# sg.tf

# Create Security Group
resource "aws_security_group" "main-vpc-sg" {
  name                     = var.main-vpc-sg_name
  description              = var.main-vpc-sg_desc
  vpc_id                   = aws_vpc.main-vpc.id

  egress {
    from_port              = var.main-vpc-sg_from_port 
    to_port                = var.main-vpc-sg_to_port 
    protocol               = var.main-vpc-sg_protocol
    cidr_blocks            = var.main-vpc-sg_cidr
  }
  tags = {
    Name                   = var.main-vpc_name
  }
}

# SG Rule: SSH
resource "aws_security_group_rule" "ssh_myip" {
  type                     = var.sg_rule_type
  from_port                = var.sg_rule_ssh_port
  to_port                  = var.sg_rule_ssh_port
  protocol                 = var.sg_protocol
  cidr_blocks              = [var.myip, var.myip_work, var.testing_ip]
  security_group_id        = aws_security_group.main-vpc-sg.id
  description              = var.sg_ssh_myip_desc
}

resource "aws_security_group_rule" "ssh" {
  type                     = var.sg_rule_type
  from_port                = var.sg_rule_ssh_port
  to_port                  = var.sg_rule_ssh_port
  protocol                 = var.sg_protocol
  cidr_blocks              = var.sg_cidr
  security_group_id        = aws_security_group.main-vpc-sg.id
  description              = var.sg_ssh_desc
}

# SG Rule: HTTP
resource "aws_security_group_rule" "http" {
  type                     = var.sg_rule_type
  from_port                = var.sg_rule_http_port
  to_port                  = var.sg_rule_http_port
  protocol                 = var.sg_protocol
  cidr_blocks              = var.sg_cidr
  security_group_id        = aws_security_group.main-vpc-sg.id
  description              = var.sg_http_desc
}

# SG Rule: HTTPS
resource "aws_security_group_rule" "https" {
  type                     = var.sg_rule_type
  from_port                = var.sg_rule_https_port
  to_port                  = var.sg_rule_https_port
  protocol                 = var.sg_protocol
  cidr_blocks              = var.sg_cidr
  security_group_id        = aws_security_group.main-vpc-sg.id
  description              = var.sg_http_desc
}