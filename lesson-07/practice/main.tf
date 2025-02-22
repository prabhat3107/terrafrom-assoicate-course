terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_ACCESS_KEY
}

resource "aws_instance" "ec2i_lession_07" {
  ami           = "ami-0e2c8caa4b6378d8c"
  instance_type   = "t2.micro"
  tags = {
    name = var.ec2_instance_name
  }
}

