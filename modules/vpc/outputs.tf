output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.this.id
}

output "public_subnet_ids" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "List of IDs of private subnets"
  value       = aws_subnet.private[*].id
}

output "public_route_table_ids" {
  description = "The ID of the public route table"
  value       = aws_route_table.public[*].id
}

output "private_route_table_ids" {
  description = "The ID of the private route table"
  value       = aws_route_table.private[*].id
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = var.enable_internet_gateway ? aws_internet_gateway.this[0].id : null
}

output "nat_gateway_id" {
  description = "ID of the NAT Gateway"
  value       = var.enable_nat_gateway ? aws_nat_gateway.this[0].id : null
}

output "elastic_ip" {
  description = "Elastic IP address associated with the instance (if created)"
  value       = var.enable_nat_gateway ? aws_eip.nat[0].public_ip : null
}

output "availability_zones" {
  description = "A list of availability zones specified as argument to this module"
  value       = var.availability_zones
}