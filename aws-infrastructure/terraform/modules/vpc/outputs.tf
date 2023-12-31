# outputs.tf
output "main-vpc" {
  value = aws_vpc.main-vpc
}

output "vpc_id" {
  value = aws_vpc.main-vpc.id
}

output "public_subnet1_id" {
  value = aws_subnet.pub-sub1.id
}

output "public_subnet2_id" {
  value = aws_subnet.pub-sub2.id
}

output "public_subnet3_id" {
  value = aws_subnet.pub-sub3.id
}

output "private_subnet1_id" {
  value = aws_subnet.pri-sub1.id
}

output "private_subnet2_id" {
  value = aws_subnet.pri-sub2.id
}

output "private_subnet3_id" {
  value = aws_subnet.pri-sub3.id
}

output "public_route_table_id" {
  value = aws_route_table.pub-rt.id
}

output "private_route_table_id" {
  value = aws_route_table.pri-rt.id
}

output "main_vpc_security_group_id" {
  value = aws_security_group.main-vpc-sg.id
}
