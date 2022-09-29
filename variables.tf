variable "aws_region" {
    description = "vpc aws region"
    default = "eu-central-1"
}

variable "vpc-cidr" {
    description = "CIDR for VPC"
    default = "10.0.0.0/16"
}

variable "public-sub-cidr" {
    description = "CIDR for public1"
    default = "10.0.5.0/24"
}

variable "public-sub-cidr2" {
    description = "CIDR for public2"
    default = "10.0.15.0/24"
}

variable "private-sub-cidr" {
    description = "CIDR for private1"
    default = "10.0.10.0/24"
}

variable "private-sub-cidr2" {
    description = "CIDR for private2"
    default = "10.0.20.0/24"
}

#maybe
variable "key_name_bastion" {
  type    = string
  default = ""
}