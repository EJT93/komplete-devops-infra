data "terraform_remote_state" "ec2" {
  backend = "s3"
  config = {
    bucket          = "elijah-terraform-state"
    key             = "r53-e-torrence-a-record/terraform.tfstate"
    region          = "us-east-2"
  }
}

# Update R53 A record
resource "aws_route53_record" "dev-react" {
  zone_id = var.zone_id
  name    = var.react_zone_name
  type    = var.zone_type
  ttl     = var.zone_ttl
  records = [var.records]

}

resource "aws_route53_record" "dev-admin" {
  zone_id = var.zone_id
  name    = var.admin_zone_name
  type    = var.zone_type
  ttl     = var.zone_ttl
  records = [var.records]
}

resource "aws_route53_record" "dev-registry" {
  zone_id = var.zone_id
  name    = var.registry_zone_name
  type    = var.zone_type
  ttl     = var.zone_ttl
  records = [var.records]
}

resource "aws_route53_record" "dev-rancher" {
  zone_id = var.zone_id
  name    = var.rancher_zone_name
  type    = var.zone_type
  ttl     = var.zone_ttl
  records = [var.records]
}

resource "aws_route53_record" "dev-kibana" {
  zone_id = var.zone_id
  name    = var.kibana_zone_name
  type    = var.zone_type
  ttl     = var.zone_ttl
  records = [var.records]
}

resource "aws_route53_record" "dev-jenkins" {
  zone_id = var.zone_id
  name    = var.jenkins_zone_name
  type    = var.zone_type
  ttl     = var.zone_ttl
  records = [var.records]
}