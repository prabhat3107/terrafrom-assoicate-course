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
}

resource "aws_s3_bucket" "backend-bucket" {
  bucket = "app01-tfs-s3-backend"
  # lifecycle {
  #   prevent_destroy = true
  # }
  tags = {
    Name = "app01-tfs-s3-backend"
    costcenter = "sriauronet"
    ManagedBy = "Terraform"
  }
}

resource "aws_s3_bucket_public_access_block" "backend_bucket_public_access_block" {
  bucket = aws_s3_bucket.backend-bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
resource "aws_dynamodb_table" "lock-table" {
  name           = "APP001_TFS_LockTable"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }

}

resource "aws_s3_bucket_versioning" "backend-bucket_versioning" {
  bucket = aws_s3_bucket.backend-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "backend_bucket_encryption" {
  bucket = aws_s3_bucket.backend-bucket.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
    }
  }
}
