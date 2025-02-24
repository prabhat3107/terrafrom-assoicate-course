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
  region = "us-west-2"
}

resource "aws_vpc" "main" {
  cidr_block = "10.1.0.0/16"

}


module "webserver" {
  # this is a reference to a module locally stored
  source     = "../modules/webserver"
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.1.0.0/16"
  #ubuntu ami in us west 2
  ami            = "ami-00c257e12d6828491"
  instance_type  = "t2.micro"
  webserver_name = "User2's"

}