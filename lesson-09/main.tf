terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.0"
}

provider "aws" {
  region = "us-east-1"
}

# Watch for an error in here! TROUBLESHOOT!
resource "aws_iam_user" "user_1" {
  name = "network_admin"
  tags = {
    Troubleshooting = "YES"
    NetworkAdmin = "YES"
    SystemAdministrator = "NO"
    NetworkAdministrator = "YES"
  }
}

