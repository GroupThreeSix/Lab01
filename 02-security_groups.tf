module "default_sg" {
  source = "./modules/security_groups"

  name        = "${var.project_name}-default-sg"
  description = "Default security group for VPC"
  vpc_id      = module.vpc.vpc_id

  ingress_rules = [
    {
      description     = "Allow all incoming traffic within the VPC"
      from_port       = 0
      to_port         = 0
      protocol        = "-1"
      cidr_blocks     = [var.vpc_cidr]
      security_groups = []
    }
  ]

  egress_rules = [
    {
      description     = "Allow all outbound traffic"
      from_port       = 0
      to_port         = 0
      protocol        = "-1"
      cidr_blocks     = ["0.0.0.0/0"]
      security_groups = []
    }
  ]
}

module "private_ec2_sg" {
  source = "./modules/security_groups"

  name        = "${var.project_name}-private-ec2-sg"
  description = "Security group for private EC2 instances"
  vpc_id      = module.vpc.vpc_id

  ingress_rules = [
    {
      description      = "Allow SSH from public EC2 instances"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = []
      ipv6_cidr_blocks = []
      security_groups  = [module.public_ec2_sg.security_group_id]
    }
  ]

  egress_rules = [
    {
      description      = "Allow all outbound traffic"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      security_groups  = []
    }
  ]
}

module "public_ec2_sg" {
  source = "./modules/security_groups"

  name        = "${var.project_name}-public-ec2-sg"
  description = "Security group for public EC2 instances"
  vpc_id      = module.vpc.vpc_id

  ingress_rules = [
    {
      description     = "Allow SSH from specific IP"
      from_port       = 22
      to_port         = 22
      protocol        = "tcp"
      cidr_blocks     = ["${var.user_ip}/32"]
      security_groups = []
    }
  ]

  egress_rules = [
    {
      description     = "Allow all outbound traffic"
      from_port       = 0
      to_port         = 0
      protocol        = "-1"
      cidr_blocks     = ["0.0.0.0/0"]
      security_groups = []
    }
  ]
}