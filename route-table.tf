# Creating RT for Private Subnet

 resource "aws_route_table" "privateRT" {    
 vpc_id = aws_vpc.vpc1.id
   route {
   cidr_block = "0.0.0.0/0"            
   nat_gateway_id = aws_nat_gateway.nat-gw.id
   }
   tags = {
     Name = "private-RT"
   }
 }

# Creating RT for Public Subnet
 resource "aws_route_table" "publicRT" {
  vpc_id =  aws_vpc.vpc1.id
     route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
     }
     tags = {
       Name = "public-RT"
     }
 }
#Associating the Public RT with the Public Subnets
resource "aws_route_table_association" "publicRTass" {
subnet_id = aws_subnet.publicsubnet.id
route_table_id = aws_route_table.publicRT.id
}

resource "aws_route_table_association" "publicRTass2" {
subnet_id = aws_subnet.publicsubnet2.id
route_table_id = aws_route_table.publicRT.id
}

#Associating the Private RT with the Private Subnets
resource "aws_route_table_association" "privateRTass" {
subnet_id = aws_subnet.privatesubnet.id
route_table_id  = aws_route_table.privateRT.id
}

resource "aws_route_table_association" "privateRTass2" {
subnet_id = aws_subnet.privatesubnet2.id
route_table_id  = aws_route_table.privateRT.id
}