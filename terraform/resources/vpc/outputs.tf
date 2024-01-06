output "main-vpc" {
  value = module.vpc.main-vpc
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet1_id" {
  value = module.vpc.public_subnet1_id
}

output "public_subnet2_id" {
  value = module.vpc.public_subnet2_id
}

output "public_subnet3_id" {
  value = module.vpc.public_subnet3_id
}

output "private_subnet1_id" {
  value = module.vpc.private_subnet1_id
}

output "private_subnet2_id" {
  value = module.vpc.private_subnet2_id
}

output "private_subnet3_id" {
  value = module.vpc.private_subnet3_id
}

output "public_route_table_id" {
  value = module.vpc.public_route_table_id
}

output "private_route_table_id" {
  value = module.vpc.private_route_table_id
}

output "main_vpc_security_group_id" {
  value = module.vpc.main_vpc_security_group_id
}

output "key-name" {
  value = module.vpc.key-name
}