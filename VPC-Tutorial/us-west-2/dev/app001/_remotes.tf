data "terraform_remote_state" "global_remote" {
  backend = "s3"
  config = {
    bucket = "app01-tfs-s3-backend"
    key    = "global/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "global_app001_remote" {
  backend = "s3"
  config = {
    bucket = "app01-tfs-s3-backend"
    key    = "global/dev/app001/terraform.tfstate"
    region = "us-east-1"
  }
}
