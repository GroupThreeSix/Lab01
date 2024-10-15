terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = ">= 3.4"
    }
  }

  # backend "s3" {
  #   bucket  = "nhom36"
  #   key     = "terraform.tfstate"
  #   region  = "us-east-1"
  #   encrypt = true
  # }
}