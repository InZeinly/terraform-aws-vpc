resource "aws_vpc" "vpc" {
  for_each = toset(var.vpc)
  cidr_block = each.value
}