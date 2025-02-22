terraform {
  required_version = ">= 1.0.0, < 2.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

}
module "webserver-prabhat" {
  source = "../modules/webserver"
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.0.0/16"
  ami = "ami-0e2c8caa4b6378d8c"
  instance_type = "t2.micro"
  webserver_name = "Prabhat Parker"
}