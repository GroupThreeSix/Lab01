data "aws_availability_zones" "available" {}

module "vpc" {
  source = "./modules/vpc"

  name               = var.project_name
  vpc_cidr           = var.vpc_cidr
  public_subnet      = var.public_subnet_cidr
  private_subnet     = var.private_subnet_cidr
  availability_zones = slice(data.aws_availability_zones.available.names, 0, 3)
  enable_nat_gateway = true
}