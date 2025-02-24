terraform {
  required_version = ">=1.4.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

}


module "webserver" {
  # this is a reference to a module locally stored
  source     = "../modules/webserver"
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.0/16"
  #ubuntu ami
  ami            = "ami-04b4f1a9cf54c11d0"
  instance_type  = "t2.micro"
  webserver_name = "Prabhat's"

}