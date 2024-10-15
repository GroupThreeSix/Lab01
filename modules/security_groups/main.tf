resource "aws_security_group" "main" {
  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id

  lifecycle {
    create_before_destroy = true
  }

  tags = merge(
    {
      Name = var.name
    },
    var.tags
  )
}

resource "aws_vpc_security_group_ingress_rule" "ingress_rules" {
  count             = length(var.ingress_rules)
  security_group_id = aws_security_group.main.id

  description       = var.ingress_rules[count.index].description
  from_port         = var.ingress_rules[count.index].from_port
  to_port           = var.ingress_rules[count.index].to_port
  ip_protocol       = var.ingress_rules[count.index].protocol
  cidr_ipv4         = length(var.ingress_rules[count.index].cidr_blocks) > 0 ? var.ingress_rules[count.index].cidr_blocks[0] : null
  referenced_security_group_id = length(var.ingress_rules[count.index].security_groups) > 0 ? var.ingress_rules[count.index].security_groups[0] : null

  tags = var.tags
}

resource "aws_vpc_security_group_egress_rule" "egress_rules" {
  count             = length(var.egress_rules)
  security_group_id = aws_security_group.main.id

  description       = var.egress_rules[count.index].description
  from_port         = var.egress_rules[count.index].from_port
  to_port           = var.egress_rules[count.index].to_port
  ip_protocol       = var.egress_rules[count.index].protocol
  cidr_ipv4         = length(var.egress_rules[count.index].cidr_blocks) > 0 ? var.egress_rules[count.index].cidr_blocks[0] : null
  referenced_security_group_id = length(var.egress_rules[count.index].security_groups) > 0 ? var.egress_rules[count.index].security_groups[0] : null

  tags = var.tags
}
