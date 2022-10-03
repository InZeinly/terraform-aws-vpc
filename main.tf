# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"


#       version = "~> 3.27"
#     }
#   }



#   # required_version = ">= 0.14.9"

# }

# provider "aws" {
#   region                = var.aws_region
# }


#test 2
# provider "aws" {
#   region = "eu-central-1"
# }

#test 3
# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 4.0"
#     }
#   }
# }

# # Configure the AWS Provider
# provider "aws" {
#   region = var.aws_region
# }


#test 4
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}