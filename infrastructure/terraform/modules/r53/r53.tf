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
  zone_id = var.react_zone_id
  name    = var.react_zone_name
  type    = var.react_zone_type
  ttl     = var.react_zone_ttl
  records = [var.records]

}

resource "aws_route53_record" "dev-admin" {
  zone_id = var.admin_zone_id
  name    = var.admin_zone_name
  type    = var.admin_zone_type
  ttl     = var.admin_zone_ttl
  records = [var.records]
}

resource "aws_route53_record" "dev-registry" {
  zone_id = var.registry_zone_id
  name    = var.registry_zone_name
  type    = var.registry_zone_type
  ttl     = var.registry_zone_ttl
  records = [var.records]
}

resource "aws_route53_record" "dev-rancher" {
  zone_id = var.rancher_zone_id
  name    = var.rancher_zone_name
  type    = var.rancher_zone_type
  ttl     = var.rancher_zone_ttl
  records = [var.records]
}

resource "aws_route53_record" "dev-kibana" {
  zone_id = var.kibana_zone_id
  name    = var.kibana_zone_name
  type    = var.kibana_zone_type
  ttl     = var.kibana_zone_ttl
  records = [var.records]
}