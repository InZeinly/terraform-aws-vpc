variable "aws_region" {
    default = "eu-central-1"
}

variable "vpc-cidr" {
    cidr_block = "192.168.0.0/16"
}

variable "public-sub-cidr" {
    cidr_block = "192.168.0.0/24"
}

variable "private-sub-cidr" {
    cidr_block = "192.168.1.0/24"
}