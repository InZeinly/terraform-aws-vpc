variable "aws_region" {
    description = "vpc aws region"
    default = "eu-central-1"
}

# variable "vpc-cidr" {
#     description = "CIDR for VPC"
#     default = "10.0.0.0/16"
# }

# variable vpc cidr for loop

variable "vpc" {
  type = map(object({
    cidr_blocks = string
  }))
  default = {
    "cidr1" = {
      cidr_blocks = "10.0.0.0/16"
      }
  }
}


# variable "public-sub-cidr" {
#     description = "CIDR for public1"
#     default = "10.0.5.0/24"
# }

# variable "public-sub-cidr2" {
#     description = "CIDR for public2"
#     default = "10.0.15.0/24"
# }

# variable "private-sub-cidr" {
#     description = "CIDR for private1"
#     default = "10.0.10.0/24"
# }

# variable "private-sub-cidr2" {
#     description = "CIDR for private2"
#     default = "10.0.20.0/24"
# }



#var for public cidr
variable "public-cidr" {
    description = "cidr for public"
    type = set(string)
    default = [ "10.0.1.0/24", "10.0.2.0/24" ]
}

#var for cidr private
# variable "private-cidr" {
#     description = "cidr for private"
#     type = set(string)
#     default = [ "10.0.10.0/24", "10.0.20.0/24" ]
# }

# subnet var with map ( dictionary )

variable "subnets" {
  default = {
    private1 = "10.0.10.0/24",
    private2 = "10.0.20.0/24"
  }
}

# var for subnets
# variable "private-subnets" {
#   description = "subnets"
#   type = set(string)
#   default = [ "private1", "private2" ]
# }

#var cidr for sg
variable "cidr-open" {
    default = [ "0.0.0.0/0" ]
}

# var for private instances
variable "privates" {
  description = "private machines"
  type = set(string)
  default = [ "private", "private2" ]
}

# instance var
variable "instance" {
    description = "aws instance type"
    default = "t2.micro"
}

# variable ports for for each

variable "ports-private" {
  type = map(object({
    port = number
    protocol = string
    cidr_blocks = list(string)
  }))
  default = {
    "80" = {
      port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    "22" = {
      port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}