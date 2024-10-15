variable "name" {
  description = "The name to give the instance"
  type        = string
}

variable "ami_id" {
  description = "The ID of the AMI to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type of the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "The key pair name for the EC2 instance"
  type        = string
}

variable "availability_zone" {
  description = "The availability zone to launch the instance in"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet to launch the instance in"
  type        = string
}

variable "security_group_ids" {
  description = "A list of security group IDs to associate with the instance"
  type        = list(string)
}

variable "associate_public_ip" {
  description = "Whether to associate a public IP address with the instance"
  type        = bool
  default     = false
}

variable "private_ip" {
  description = "The private IP address to assign to the instance"
  type        = string
  default     = null
}

variable "user_data" {
  description = "The user data to pass to the instance"
  type        = string
  default     = null
}