variable "aws_region" {
    description = "vpc aws region"
    default = "eu-central-1"
}

variable "vpc-cidr" {
    description = "asd"
    cidr_block = "172.31.0.0/16"
}

variable "public-sub-cidr" {
    description = "asd1"
    cidr_block = "172.31.0.0/24"
}

variable "private-sub-cidr" {
    description = "asd2"
    cidr_block = "172.31.1.0/24"
}