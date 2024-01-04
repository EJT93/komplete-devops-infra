resource "aws_security_group_rule" "jenkins_http" {
  type              = var.sg_rule_type
  from_port         = var.jenkins_port
  to_port           = var.jenkins_port
  protocol          = var.sg_protocol
  cidr_blocks       = [data.external.my_ip.result["cidr"]]
  security_group_id = data.aws_security_group.my-vpc-sg.id
}

resource "aws_security_group_rule" "ssh_my_ip" {
  type              = var.sg_rule_type
  from_port         = var.sg_ssh_port  # or any other port you want to open
  to_port           = var.sg_ssh_port
  protocol          = var.sg_protocol
  cidr_blocks       = [data.external.my_ip.result["cidr"]]
  security_group_id = data.aws_security_group.my-vpc-sg.id
}

# SG Rule: HTTP
resource "aws_security_group_rule" "http" {
  type              = var.sg_rule_type
  from_port         = var.sg_http_port
  to_port           = var.sg_http_port
  protocol          = var.sg_protocol
  cidr_blocks       = [data.external.my_ip.result["cidr"]]
  security_group_id = data.aws_security_group.my-vpc-sg.id
  description       = var.sg_http_desc
}

# SG Rule: HTTPS
resource "aws_security_group_rule" "https" {
  type              = var.sg_rule_type
  from_port         = var.sg_https_port
  to_port           = var.sg_https_port
  protocol          = var.sg_protocol
  cidr_blocks       = [data.external.my_ip.result["cidr"]]
  security_group_id = data.aws_security_group.my-vpc-sg.id
  description       = var.sg_http_desc
}