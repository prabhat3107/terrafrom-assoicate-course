provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}

provider "aws" {
  alias  = "ap-southeast-1"
  region = "ap-southeast-1"
}

provider "aws" {
  alias  = "us-west-2"
  region = "us-west-2"
}