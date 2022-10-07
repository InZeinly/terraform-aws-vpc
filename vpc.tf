resource "aws_vpc" "vpc" {
  for_each = tolist(var.vpc)
  cidr_block = each.value
}