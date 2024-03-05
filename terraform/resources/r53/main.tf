module "records" {
source              = "../../modules/r53"

zone_id             = var.zone_id
region              = var.region
records             = var.records
react_zone_name     = var.react_zone_name
admin_zone_name     = var.admin_zone_name
registry_zone_name  = var.registry_zone_name
rancher_zone_name   = var.rancher_zone_name
kibana_zone_name    = var.kibana_zone_name
jenkins_zone_name   = var.jenkins_zone_name

zone_type           = var.zone_type
zone_ttl            = var.zone_ttl
}