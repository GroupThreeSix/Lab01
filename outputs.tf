# VPC Outputs
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnet_ids
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = module.vpc.internet_gateway_id
}

output "nat_gateway_id" {
  description = "ID of the NAT Gateway"
  value       = module.vpc.nat_gateway_id
}

# EC2 Outputs
output "public_instance_ids" {
  description = "List of IDs of public EC2 instances"
  value       = module.public_ec2[*].instance_id
}

output "public_instance_public_ips" {
  description = "List of public IP addresses of public EC2 instances"
  value       = module.public_ec2[*].instance_public_ip
}

output "private_instance_ids" {
  description = "List of IDs of private EC2 instances"
  value       = module.private_ec2[*].instance_id
}

output "private_instance_private_ips" {
  description = "List of private IP addresses of private EC2 instances"
  value       = module.private_ec2[*].instance_private_ip
}

# Security Group Outputs
output "public_security_group_id" {
  description = "The ID of the public security group"
  value       = module.public_ec2_sg.security_group_id
}

output "private_security_group_id" {
  description = "The ID of the private security group"
  value       = module.private_ec2_sg.security_group_id
}

# Key Pair Output
output "key_pair_name" {
  description = "The name of the created key pair"
  value       = module.keypair.key_pair_name
}

