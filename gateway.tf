resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc1.id
}

resource "aws_eip" "aws-eip" {
  vpc = true
}

resource "aws_nat_gateway" "nat-gw" {
    allocation_id = aws_eip.aws-eip.id
    subnet_id = aws_subnet.publicsubnet.id
}