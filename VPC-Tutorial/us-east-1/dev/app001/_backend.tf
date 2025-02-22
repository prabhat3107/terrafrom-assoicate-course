terraform {
  backend "s3" {
    key            = "us-east-1/dev/app001/terraform.tfstate"
    region         = "us-east-1"
    bucket         = "app01-tfs-s3-backend"
    dynamodb_table = "APP001_TFS_LockTable"
    encrypt        = true # Optional, S3 Bucket Server Side Encryption
  }
}
