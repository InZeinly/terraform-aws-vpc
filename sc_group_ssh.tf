resource "aws_security_group" "private" {
    name = "SC for Web Instance"
    description = "Allow trafic"
    for_each = aws_vpc.vpc
    vpc_id = each.value.id

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
      for_each = aws_security_group.bastion_sg
      security_groups = each.value
    }

    tags = {
      Name = "For Private"
    }
}

resource "aws_security_group" "bastion_sg" {
    name = "SC for Bastion"
    description = "bastion sg"
    for_each = aws_vpc.vpc
    vpc_id = each.value.id

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