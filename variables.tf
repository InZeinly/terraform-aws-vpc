variable "aws_region" {
    description = "vpc aws region"
    default = "eu-central-1"
}

variable "vpc-cidr" {
    description = "asd"
    default = "10.0.0.0/16"
}

variable "public-sub-cidr" {
    description = "asd1"
    default = "10.0.5.0/24"
}

variable "private-sub-cidr" {
    description = "asd2"
    default = "10.0.10.0/24"
}

variable "public-sub-cidr2" {
    description = "asd1"
    default = "10.0.15.0/24"
}

variable "private-sub-cidr2" {
    description = "asd1"
    default = "10.0.20.0/24"
}

