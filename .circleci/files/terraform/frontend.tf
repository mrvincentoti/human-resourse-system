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
  acl    = "public-read" 
  website {    
    index_document = "index.html"    
    error_document = "404.html"
  }
  tags = {
    Environment = var.environment_name
  }
}

resource "aws_s3_bucket_policy" "front-end" {  
  bucket = aws_s3_bucket.front-end.id   
  policy = <<POLICY
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "PublicReadForGetBucketObjects",
        "Effect": "Allow",
        "Principal": "*",
        "Action": [
          "s3:GetObject"
        ],
        "Resource": [
          "arn:aws:s3:::${aws_s3_bucket.front-end.id}/*"
        ]
      }
    ]
  }
  POLICY
}