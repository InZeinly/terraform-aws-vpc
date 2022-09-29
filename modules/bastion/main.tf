resource "aws_instance" "bastion" {
    ami = data.aws_ami.ubuntu_18_04.id
    instance_type = "t2.micro"
    #Assign to subnet
    subnet_id = aws_subnet.publicsubnet.id
    key_name = var.key_name.id
    vpc_security_group_ids = aws_security_group.ssh.id
    user_data = data.template_file.user_data.rendered

    tags = {
      Name = "EC-2 bastion"
    }
}

data "template_file" "user_data" {
  template = tempaltefile("modules/bastion/user_data.tftpl", {
    private_key-pem = var.private_key_pem
  })
}

resource "aws_security_group" "bastion_sg" {
    name = "bastion security group"
    description = "Allow trafic"
    vpc_id = aws_vpc.vpc1.id

    ingress = {
      cidr_blocks = [ "0.0.0.0/0" ]
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

    tags = {
      Name = "bastion security group"
    }
}