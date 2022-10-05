resource "aws_instance" "bastion" {
    ami = data.aws_ami.ubuntu_18_04.id
    instance_type = "t2.micro"
    #Assign to subnet
    subnet_id = aws_subnet.publicsubnet.id
    key_name = var.key_name
    security_groups = [ aws_security_group.bastion_sg.id ]

    tags = {
      Name = "EC-2 bastion"
    }
}

# resource "aws_instance" "Public2" {
#     ami = data.aws_ami.ubuntu_18_04.id
#     instance_type = "t2.micro"
#     #Assign to subnet
#     subnet_id = aws_subnet.publicsubnet2.id
#     key_name = var.key_name
#     security_groups = [ aws_security_group.ssh.id ]

#     tags = {
#       Name = "Public 2"
#     }
# }

resource "aws_instance" "private1" {
    ami = data.aws_ami.ubuntu_18_04.id
    instance_type = "t2.micro"
    #Assign to subnet
    subnet_id = aws_subnet.privatesubnet.id
    key_name = var.key_name
    security_groups = [ aws_security_group.private.id ]

    user_data = <<EOF
    #!/bin/bash
    sudo apt update -y
    sudo apt install apache2 -y
    EOF

    tags = {
      Name = "Private 1"
    }
}

resource "aws_instance" "private2" {
    ami = data.aws_ami.ubuntu_18_04.id
    instance_type = "t2.micro"
    #Assign to subnet
    subnet_id = aws_subnet.privatesubnet2.id
    key_name = var.key_name
    security_groups = [ aws_security_group.private.id ]

    tags = {
      Name = "Private 2"
    }
} 