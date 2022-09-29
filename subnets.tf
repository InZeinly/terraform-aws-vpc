resource "aws_subnet" "privatesubnet" {
    vpc_id = aws_vpc.vpc1.id
    cidr_block = var.private-sub-cidr
}

resource "aws_subnet" "publicsubnet" {
    vpc_id = aws_vpc.vpc1.id
    cidr_block = var.public-sub-cidr
}

resource "aws_subnet" "privatesubnet2" {
    vpc_id = aws_vpc.vpc1.id
    cidr_block = var.private-sub-cidr2
}

resource "aws_subnet" "publicsubnet2" {
    vpc_id = aws_vpc.vpc1.id
    cidr_block = var.public-sub-cidr2
}