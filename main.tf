resource "aws_key_pair" "this" {
  key_name   = var.key_name
  public_key = file("~/.ssh/id_ed25519.pub")
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.1.0/24"]
  private_subnet_cidrs = ["10.0.3.0/24"]
  availability_zones   = ["us-east-1a", "us-east-1b"]
}

module "nat_gateway" {
  source = "./modules/nat_gateway"

  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
}

module "route_tables" {
  source = "./modules/route_tables"

  vpc_id              = module.vpc.vpc_id
  internet_gateway_id = module.vpc.internet_gateway_id
  public_subnet_ids   = module.vpc.public_subnet_ids
  private_subnet_ids  = module.vpc.private_subnet_ids
  nat_gateway_ids     = module.nat_gateway.nat_gateway_ids
}

module "security_groups" {
  source = "./modules/security_groups"

  vpc_id  = module.vpc.vpc_id
  user_ip = var.user_ip

  public_ingress_rules = [
    {
      description = "SSH from user IP"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = []
    },
    {
      description = "HTTP from anywhere"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  private_ingress_rules = [
    {
      description     = "SSH from public instance"
      from_port       = 22
      to_port         = 22
      protocol        = "tcp"
      security_groups = []
    },
    {
      description     = "Custom TCP from public instance"
      from_port       = 8080
      to_port         = 8080
      protocol        = "tcp"
      security_groups = []
    }
  ]
}

module "ec2" {
  source = "./modules/ec2"

  public_instance_count  = var.public_instance_count
  private_instance_count = var.private_instance_count
  public_subnet_id       = module.vpc.public_subnet_ids[0]
  private_subnet_id      = module.vpc.private_subnet_ids[0]
  public_sg_id           = module.security_groups.public_sg_id
  private_sg_id          = module.security_groups.private_sg_id
  key_name               = aws_key_pair.this.key_name
}