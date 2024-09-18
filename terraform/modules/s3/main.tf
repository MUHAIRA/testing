resource "aws_s3_bucket" "assets_bucket" {
  bucket = "${var.bucket_name}-${var.environment}"
  acl    = "private"

  tags = {
    Name        = "${var.bucket_name}-${var.environment}"
    Environment = var.environment
  }
}
