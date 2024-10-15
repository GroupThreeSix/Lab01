variable "aws_region" {
  description = "The AWS region to deploy the resources"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "groupthreesix"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "user_ip" {
  description = "The IP address of the user for SSH access"
  type        = string
}

variable "key_name" {
  description = "The name of the key pair for SSH access"
  type        = string
  default     = "groupthreesix"
}

variable "create_resources" {
  description = "Whether to create the resources"
  type        = bool
  default     = true
}