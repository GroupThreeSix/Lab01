variable "aws_region" {
  description = "The AWS region to deploy the resources"
  type        = string
  default     = "us-east-1"
}

variable "user_ip" {
  description = "The IP address of the user for SSH access"
  type        = string
}

variable "key_name" {
  description = "The name of the key pair for SSH access"
  type        = string
}

variable "public_instance_count" {
  description = "The number of public instances to deploy"
  type        = number
  default     = 1
}

variable "private_instance_count" {
  description = "The number of private instances to deploy"
  type        = number
  default     = 1
}

variable "create_resources" {
  description = "Whether to create the resources"
  type        = bool
  default     = true
}