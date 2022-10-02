resource "aws_security_group" "ssh" {
    name = "SC for Web Instance"
    description = "Allow trafic"
    vpc_id = aws_vpc.vpc1.id

    ingress = {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "some"
      from_port = 22
      protocol = "tcp"
      to_port = 22
    } 

    egress = {
      cidr_blocks = [ "0.0.0.0/0" ]
      from_port = 0
      protocol = "-1"
      to_port = 0
    }
}

# resource "aws_security_group" "bastion_sg" {
#     name = "SC for Bastion"
#     description = "bastion sg"
#     vpc_id = aws_vpc.vpc1.id

#     ingress = {
#       cidr_blocks = [ "0.0.0.0/0" ]
#       description = "some"
#       from_port = 22
#       protocol = "tcp"
#       to_port = 22
#     }

#     egress = {
#       cidr_blocks = [ "0.0.0.0/0" ]
#       from_port = 0
#       protocol = "-1"
#       to_port = 0
#     }
# }