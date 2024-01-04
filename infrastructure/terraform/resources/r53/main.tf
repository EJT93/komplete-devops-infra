module "records" {
source              = "../../modules/r53"

react_zone_id       = var.react_zone_id
react_zone_name     = var.react_zone_name
react_zone_ttl      = var.react_zone_ttl
react_zone_type     = var.react_zone_type

region              = var.region
records             = var.records


admin_zone_id       = var.admin_zone_id
admin_zone_name     = var.admin_zone_name
admin_zone_ttl      = var.admin_zone_ttl
admin_zone_type     = var.admin_zone_type

registry_zone_id    = var.registry_zone_id
registry_zone_name  = var.registry_zone_name
registry_zone_ttl   = var.registry_zone_ttl
registry_zone_type  = var.registry_zone_type

rancher_zone_id     = var.rancher_zone_id
rancher_zone_name   = var.rancher_zone_name
rancher_zone_type   = var.rancher_zone_type
rancher_zone_ttl    = var.rancher_zone_ttl

kibana_zone_id      = var.kibana_zone_id 
kibana_zone_name    = var.kibana_zone_name 
kibana_zone_type    = var.kibana_zone_type
kibana_zone_ttl     = var.kibana_zone_ttl

}