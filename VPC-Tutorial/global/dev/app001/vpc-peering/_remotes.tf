data "terraform_remote_state" "global_app001_remote" {
  backend = "s3"
  config = {
    bucket = "app01-tfs-s3-backend"
    key    = "global/dev/app001/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "ap_southeast_1_app001_remote" {
  backend = "s3"
  config = {
    bucket = "app01-tfs-s3-backend"
    key    = "ap-southeast-1/dev/app001/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "us_east_1_app001_remote" {
  backend = "s3"
  config = {
    bucket = "app01-tfs-s3-backend"
    key    = "us-east-1/dev/app001/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "us_west_2_app001_remote" {
  backend = "s3"
  config = {
    bucket = "app01-tfs-s3-backend"
    key    = "us-west-2/dev/app001/terraform.tfstate"
    region = "us-east-1"
  }
}
