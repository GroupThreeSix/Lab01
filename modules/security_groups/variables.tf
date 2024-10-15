variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "user_ip" {
  description = "The IP address of the user for SSH access"
  type        = string
}

variable "public_ingress_rules" {
  description = "List of ingress rules for public security group"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      description = "SSH from user IP"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = []  # This will be set in the module
    }
  ]
}

variable "private_ingress_rules" {
  description = "List of ingress rules for private security group"
  type = list(object({
    description     = string
    from_port       = number
    to_port         = number
    protocol        = string
    security_groups = list(string)
  }))
  default = [
    {
      description     = "SSH from public instance"
      from_port       = 22
      to_port         = 22
      protocol        = "tcp"
      security_groups = []  # This will be set in the module
    }
  ]
}