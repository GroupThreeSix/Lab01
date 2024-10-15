resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = merge(
    { "Name" = var.name },
    var.tags,
  )
}

# Public Subnet

resource "aws_subnet" "public" {
  count                   = length(var.public_subnet)
  vpc_id                  = aws_vpc.this.id
  cidr_block              = element(var.public_subnet, count.index)
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = true

  tags = merge(
    {
      "Name" = format("${var.name}-public-%s", element(var.availability_zones, count.index))
    },
    var.tags,
  )
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  tags = merge(
    { "Name" = "${var.name}-public" },
    var.tags,
  )
}

resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public)
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public.id
}

# Private Subnet

resource "aws_subnet" "private" {
  count             = length(var.private_subnet)
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_subnet[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = merge(
    {
      "Name" = format("${var.name}-private-%s", element(var.availability_zones, count.index))
    },
    var.tags,
  )
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id

  tags = merge(
    { "Name" = "${var.name}-private" },
    var.tags,
  )
}

resource "aws_route_table_association" "private" {
  count          = length(aws_subnet.private)
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = aws_route_table.private.id
}

# Internet Gateway

resource "aws_internet_gateway" "this" {
  count = var.enable_internet_gateway ? 1 : 0 
  vpc_id = aws_vpc.this.id

  tags = merge(
    { "Name" = var.name },
    var.tags,
    var.igw_tags,
  )
}

# Elastic IP for NAT Gateway

resource "aws_eip" "nat" {
  count  = var.enable_nat_gateway ? 1 : 0
  domain = "vpc"

  tags = merge(
    {
      Name = format("${var.name}-nat-eip-%s", var.availability_zones)
    },
    var.tags
  )

  depends_on = [ aws_internet_gateway.this ]
}

# NAT Gateway

resource "aws_nat_gateway" "this" {
  count         = var.enable_nat_gateway ? 1 : 0
  allocation_id = aws_eip.nat[0].id
  subnet_id     = element(aws_subnet.public.*.id, 0)

  tags = merge(
    {
      Name = format("${var.name}-nat-gateway-%s", var.availability_zones)
    },
    var.tags
  )
}