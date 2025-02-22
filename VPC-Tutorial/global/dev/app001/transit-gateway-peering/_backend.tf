terraform {
  backend "s3" {
    key            = "global/dev/app001/transit-gateway-peering/terraform.tfstate"
    region         = "us-east-1"
    bucket         = "app01-tfs-s3-backend"
    dynamodb_table = "APP001_TFS_LockTable"
    encrypt        = true # Optional, S3 Bucket Server Side Encryption
  }
}