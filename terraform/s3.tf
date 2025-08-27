resource "aws_s3_bucket" "app_data" {
  bucket = "${var.project}-${var.env}-app-data"

  tags = {
    Name    = "${var.project}-${var.env}-app-data"
    Project = var.project
    Env     = var.env
  }
}

resource "aws_s3_bucket_versioning" "app_data" {
  bucket = aws_s3_bucket.app_data.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "app_data" {
  bucket = aws_s3_bucket.app_data.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}