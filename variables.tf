variable "aws_region" {
  description = "The AWS region to deploy the resources"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "my-project"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = list(string)
  default     = ["10.0.2.0/24"]
}

variable "user_ip" {
  description = "The IP address of the user for SSH access"
  type        = string
}

variable "key_name" {
  description = "The name of the key pair for SSH access"
  type        = string
  default     = "my-key"
}

variable "create_resources" {
  description = "Whether to create the resources"
  type        = bool
  default     = true
}