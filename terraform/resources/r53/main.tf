module "records" {
source              = "../../modules/r53"

region              = var.region
records             = var.records

react_zone_id       = var.react_zone_id
react_zone_name     = var.react_zone_name

admin_zone_id       = var.admin_zone_id
admin_zone_name     = var.admin_zone_name

registry_zone_id    = var.registry_zone_id
registry_zone_name  = var.registry_zone_name

rancher_zone_id     = var.rancher_zone_id
rancher_zone_name   = var.rancher_zone_name

kibana_zone_id      = var.kibana_zone_id 
kibana_zone_name    = var.kibana_zone_name 

zone_type           = var.zone_type
zone_ttl            = var.zone_ttl
}