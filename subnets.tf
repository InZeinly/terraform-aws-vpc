# resource "aws_subnet" "privatesubnet" {
#     vpc_id = aws_vpc.vpc1.id
#     cidr_block = var.private-sub-cidr
    
#     tags = {
#       Name = "private-1"
#     }

#     depends_on = [
#       aws_vpc.vpc1
#     ]
# }

# resource "aws_subnet" "privatesubnet2" {
#     vpc_id = aws_vpc.vpc1.id
#     cidr_block = var.private-sub-cidr2

#     tags = {
#       Name = "private-2"
#     }

#     depends_on = [
#       aws_vpc.vpc1
#     ]
# }

#private subnets with for
resource "aws_subnet" {
  for_each = var.private-cidr
  name = var.private-subnets
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