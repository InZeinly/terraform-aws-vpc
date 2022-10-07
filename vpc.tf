resource "aws_vpc" "vpc" {
  for_each = var.vpc[each.key]
  cidr_block = each.value
}