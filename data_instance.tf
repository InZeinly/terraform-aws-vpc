data "aws_ami" "ubuntu_18_04" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  owners = ["amazon"] # Canonical
}

variable "key_name" {
    description = "Key name"
    default = "aws-terraform"
}

# just for info
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