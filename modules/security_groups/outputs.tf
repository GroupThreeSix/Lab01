output "security_group_id" {
  description = "ID of the security group"
  value       = aws_security_group.main.id
}

output "security_group_name" {
  description = "Name of the security group"
  value       = aws_security_group.main.name
}

output "security_group_vpc_id" {
  description = "VPC ID of the security group"
  value       = aws_security_group.main.vpc_id
}
