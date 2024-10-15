output "public_instance_public_ip" {
  description = "The public IP of the public EC2 instance"
  value       = module.ec2.public_instance_public_ip[*]
}

output "private_instance_id" {
  description = "The ID of the private EC2 instance"
  value       = module.ec2.private_instance_id[*]
}