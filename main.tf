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

# provider "aws" {
#   region = "eu-central-1"
# }

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