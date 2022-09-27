resource "aws_subnet" "privatesubnet" {
    vpc_id = aws_vpc.vpc1.id
    cidr_block = var.private-sub-cidr
}

resource "aws_subnet" "publicsubnet" {
    vpc_id = aws_vpc.vpc1.id
    cidr_block = var.public-sub-cidr
}