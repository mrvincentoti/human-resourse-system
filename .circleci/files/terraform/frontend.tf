terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
        }
    }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "front-end" {
  bucket = "udapeople-${var.bucket_name}"
  tags = {
    Environment = var.environment_name
    }
}