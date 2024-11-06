provider "aws" {
  region = var.aws_region
}   

terraform {
backend "s3" {
    bucket = "groupthreesix"
    key    = "state/terraform.tfstate"  
    region = var.aws_region  
  }
}