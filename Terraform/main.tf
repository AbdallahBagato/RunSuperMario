terraform {
  required_providers {
    aws = { 
        version = "5.0"           
    }
  }
}
provider "aws" {
  region  = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "bagato-s3"
    key    = "terraform.tfstate"
    region = "us-east-1"
    # dynamodb_table = 
  }
}
