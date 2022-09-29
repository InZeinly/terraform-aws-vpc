# resource "aws_instance" "bastion" {
#     ami = data.aws_ami.ubuntu_18_04.id
#     instance_type = "t2.micro"
#     #Assign to subnet
#     subnet_id = aws_subnet.publicsubnet.id
#     key_name = var.key_name.id
#     vpc_security_group_ids = aws_security_group.sc_web_instance.id

#     tags = {
#       Name = "EC-2 bastion"
#     }
# }

# resource "aws_instance" "web" {
#     ami = data.aws_ami.ubuntu_18_04.id
#     instance_type = "t2.micro"
#     #Assign to subnet
#     subnet_id = aws_subnet.publicsubnet2.id
#     key_name = var.key_name.id
#     vpc_security_group_ids = aws_security_group.sc_web_instance.id

#     tags = {
#       Name = "EC-2 web"
#     }
# }

# resource "aws_instance" "private1" {
#     ami = data.aws_ami.ubuntu_18_04.id
#     instance_type = "t2.micro"
#     #Assign to subnet
#     subnet_id = aws_subnet.privatesubnet.id
#     key_name = var.key_name.id
#     vpc_security_group_ids = aws_security_group.sc_web_instance.id

#     tags = {
#       Name = "EC-2 web"
#     }
# }