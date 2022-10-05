resource "aws_subnet" "privatesubnet" {
    vpc_id = aws_vpc.vpc1.id
    cidr_block = var.private-sub-cidr
    
    tags = {
      Name = "private-1"
    }

    depends_on = [
      aws_vpc.vpc1
    ]
}

resource "aws_subnet" "privatesubnet2" {
    vpc_id = aws_vpc.vpc1.id
    cidr_block = var.private-sub-cidr2

    tags = {
      Name = "private-2"
    }

    depends_on = [
      aws_vpc.vpc1
    ]
}

resource "aws_subnet" "publicsubnet" {
    vpc_id = aws_vpc.vpc1.id
    cidr_block = var.public-sub-cidr
    map_public_ip_on_launch = true
    tags = {
      Name = "public-1"
    }

    depends_on = [
      aws_vpc.vpc1
    ]
}

resource "aws_subnet" "publicsubnet2" {
    vpc_id = aws_vpc.vpc1.id
    cidr_block = var.public-sub-cidr2

    tags = {
      Name = "public-2"
    }

    depends_on = [
      aws_vpc.vpc1
    ]
}

# use count to shortened code by index
# check count and for each

# For the project we need
# try to use dynamic blocks
# creating dynamic vpc
#hardcode only in variables

# automatically counted how much avialability in this region
# how much public priv created 
