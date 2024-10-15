output "key_pair_name" {
  description = "The name of the created key pair"
  value       = try(aws_key_pair.this.key_name, "")
}

output "key_pair_id" {
  description = "The ID of the created key pair"
  value       = try(aws_key_pair.this.key_pair_id, "")
}

output "public_key" {
  description = "The public key of the created key pair"
  value       = try(aws_key_pair.this.public_key, "")
}

output "private_key_openssh" {
  description = "The private key in OpenSSH format, if created"
  value       = try(tls_private_key.this[0].private_key_openssh, "")
  sensitive   = true
}

output "private_key_pem" {
  description = "The private key in PEM format, if created"
  value       = try(tls_private_key.this[0].private_key_pem, "")
  sensitive   = true
}
