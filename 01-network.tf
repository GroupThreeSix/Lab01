data "aws_availability_zones" "available" {}

locals {
  azs      = slice(data.aws_availability_zones.available.names, 0, 2)
  public_subnet = [for k, v in local.azs : cidrsubnet(var.vpc_cidr, 8, k)]
  private_subnet = [for k, v in local.azs : cidrsubnet(var.vpc_cidr, 8, k + 4)]
}

module "vpc" {
  source = "./modules/vpc"

  name               = var.project_name
  vpc_cidr           = var.vpc_cidr

  availability_zones = local.azs
  public_subnet      = local.public_subnet
  private_subnet     = local.private_subnet

  enable_nat_gateway = true
}

resource "aws_route" "internet_gateway" {
  route_table_id         = module.vpc.public_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = module.vpc.internet_gateway_id
}

resource "aws_route" "nat_gateway" {
  route_table_id         = module.vpc.private_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = module.vpc.nat_gateway_id
}