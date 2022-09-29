terraform {
  required_providers {
    aws = {
    source  = "hashicorp/aws"


    version = "~> 3.27"
    }
  }



  required_version = ">= 0.14.9"

}

provider "aws" {
  region                = var.aws_region
}

module "bastion" {
  source = "./modules/bastion"
  # private_subnet_id = module.vpc.private_subnet_id
  # public_subnet_id = module.vpc.public_subnet_id
  # vpc_id = module.vpc.vpc_id
  private_key_pem = module.key.private_key_pem
  aws_ami_id = data.aws_ami.ubuntu_18_04.id
  sg_bar_ingress_ports = var.sg_bar_ingress_ports
  key_name_bastion = var.key_name_bastion
  # instance_type = var.instance_type
  depends_on = [module.key]
}

module "key" {
  source = "./modules/key"
  
}
data "aws_ami" "ubuntu_18_04" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  # filter {
  #   name   = "virtualization-type"
  #   values = ["hvm"]
  # }

  # filter {
  #   name   = "root-device-type"
  #   values = ["ebs"]
  # }

  owners = ["amazon"] # Canonical
}

# variable "key_name" {
#     description = "Key name"
#     default = "aws-terraform"
# }