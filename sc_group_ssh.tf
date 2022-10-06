resource "aws_security_group" "private" {
    name = "SC for Web Instance"
    description = "Allow trafic"
    vpc_id = aws_vpc.vpc1.id

    # ingress {
    #   cidr_blocks = [ "0.0.0.0/0" ]
    #   description = "some"
    #   from_port = 22
    #   protocol = "tcp"
    #   to_port = 22
    # } 

    # ingress {
    #   cidr_blocks = [ "0.0.0.0/0" ]
    #   description = "some"
    #   from_port = 80
    #   protocol = "tcp"
    #   to_port = 80
    # } 

    # dynamic block for ingress
  dynamic "ingress" {
    for_each = var.ports-private
    content{
      description = "some"
      from_port = ingress.value.port
      to_port = ingress.value.port
      protocol = ingess.value.protocol
      cidr_blocks = ingress.value.cidr_block
    }
  }


    egress {
      cidr_blocks = [ "0.0.0.0/0" ]
      from_port = 0
      protocol = "-1"
      to_port = 0
      security_groups = [ aws_security_group.bastion_sg.id]
    }

    tags = {
      Name = "For Private"
    }
}

resource "aws_security_group" "bastion_sg" {
    name = "SC for Bastion"
    description = "bastion sg"
    vpc_id = aws_vpc.vpc.id

    ingress {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "some"
      from_port = 22
      protocol = "tcp"
      to_port = 22
    }

    egress {
      cidr_blocks = [ "0.0.0.0/0" ]
      from_port = 0
      protocol = "-1"
      to_port = 0
    }

    depends_on = [
      aws_vpc.vpc
    ]

    tags = {
      Name = "Bastion group"
    }
}