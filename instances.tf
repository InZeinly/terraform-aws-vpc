resource "aws_instance" "bastion" {
    ami = data.aws_ami.ubuntu_18_04.id
    instance_type = "t2.micro"
    #Assign to subnet
    for_each = aws_subnet.publicsubnet
    subnet_id = each.value.id
    # subnet_id = aws_subnet.publicsubnet.id
    key_name = var.key_name
    # security_groups = [ aws_security_group.bastion_sg.id ]
    security_groups = each.value

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
    # subnet_id = aws_subnet.privatesubnet.id
    for_each = aws_subnet.private-subnet
    subnet_id = each.value.id
    key_name = var.key_name
    security_groups = each.value
    # security_groups = [ aws_security_group.private.id ]


    user_data = <<EOF
    #!/bin/bash
    sudo apt update -y
    sudo apt install apache2 -y
    EOF

    tags = {
      Name = "Private ${each.key}"
    }
}

# resource "aws_instance" "private2" {
#     ami = data.aws_ami.ubuntu_18_04.id
#     instance_type = "t2.micro"
#     #Assign to subnet
#     subnet_id = aws_subnet.privatesubnet2.id
#     key_name = var.key_name
#     security_groups = [ aws_security_group.private.id ]

#     tags = {
#       Name = "Private 2"
#     }
# } 

# try create aws instance with for each loop
# resource "aws_instance" {
#   for_each = var.privates
#   name = each.value
# }
