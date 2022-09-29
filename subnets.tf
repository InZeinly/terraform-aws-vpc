resource "aws_subnet" "privatesubnet" {
    vpc_id = aws_vpc.vpc1.id
    cidr_block = var.private-sub-cidr

    tags = {
      Name = "private-1"
    }
}

resource "aws_subnet" "privatesubnet2" {
    vpc_id = aws_vpc.vpc1.id
    cidr_block = var.private-sub-cidr2

    tags = {
      Name = "private-2"
    }
}

resource "aws_subnet" "publicsubnet" {
    vpc_id = aws_vpc.vpc1.id
    cidr_block = var.public-sub-cidr

    tags = {
      Name = "public-1"
    }
}

resource "aws_subnet" "publicsubnet2" {
    vpc_id = aws_vpc.vpc1.id
    cidr_block = var.public-sub-cidr2

    tags = {
      Name = "public-2"
    }
}