terraform {
  backend "s3" {
    bucket = "mybuck9955statelock"
    dynamodb_table = "state-lock"
    key = "global/mystatefile/terraform.tfstate"
    region = "eu-central-1"
    encrypt=true
    }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}



# Configure the AWS Provider
provider "aws" {
  region                   = "eu-central-1"

}


