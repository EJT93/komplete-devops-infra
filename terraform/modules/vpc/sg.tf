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

# Self-referential SG Rule: SSH within the Security Group
resource "aws_security_group_rule" "ssh_self" {
  type              = var.sg_rule_type
  from_port         = var.sg_rule_ssh_port
  to_port           = var.sg_rule_ssh_port
  protocol          = var.sg_protocol
  security_group_id = aws_security_group.main-vpc-sg.id
  source_security_group_id = aws_security_group.main-vpc-sg.id
  description       = "Allow SSH access within the SG"
}