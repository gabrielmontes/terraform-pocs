resource "aws_s3_bucket" "poc" {
  bucket = var.name
  tags = {
    Name = "poc-bucket"
  }
}

resource "aws_s3_bucket_versioning" "poc-versioning" {
  bucket = aws_s3_bucket.poc.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_acl" "poc-acl" {
  bucket     = aws_s3_bucket.poc.id
  acl        = var.acl_type
  depends_on = [aws_s3_bucket_ownership_controls.acl_ownership]
}

resource "aws_s3_bucket_ownership_controls" "acl_ownership" {
  bucket = aws_s3_bucket.poc.id
  rule {
    object_ownership = "ObjectWriter"
  }
}
