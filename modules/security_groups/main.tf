resource "aws_security_group" "public" {
  name        = "public-sg"
  description = "Security group for public instance"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.public_ingress_rules
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = length(ingress.value.cidr_blocks) > 0 ? ingress.value.cidr_blocks : [var.user_ip]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "public-sg"
  }
}

resource "aws_security_group" "private" {
  name        = "private-sg"
  description = "Security group for private instance"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.private_ingress_rules
    content {
      description     = ingress.value.description
      from_port       = ingress.value.from_port
      to_port         = ingress.value.to_port
      protocol        = ingress.value.protocol
      security_groups = length(ingress.value.security_groups) > 0 ? ingress.value.security_groups : [aws_security_group.public.id]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "private-sg"
  }
}