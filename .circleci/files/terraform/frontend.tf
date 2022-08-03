resource "aws_s3_bucket" "front-end" {
  bucket = "udapeople-${var.bucket_name}"
  tags = {
    Environment = var.environment_name
    }
}