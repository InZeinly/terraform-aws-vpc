resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc1.id
  tags = {
    Name = "IGW"
  }
  depends_on = [
      aws_vpc.vpc1
    ]
}

resource "aws_eip" "aws-eip" {
  vpc = true
}

resource "aws_nat_gateway" "nat-gw" {
    allocation_id = aws_eip.aws-eip.id
    subnet_id = aws_subnet.publicsubnet.id

    tags = {
      Name = "nat-gw"
    }

    depends_on = [
      aws_internet_gateway.igw
    ]
}