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

variable "public_subnet_id" {
  description = "The ID of the public subnet"
  type        = string
}

variable "private_subnet_id" {
  description = "The ID of the private subnet"
  type        = string
}

variable "public_sg_id" {
  description = "The ID of the public security group"
  type        = string
}

variable "private_sg_id" {
  description = "The ID of the private security group"
  type        = string
}

variable "key_name" {
  description = "The name of the key pair for SSH access"
  type        = string
}