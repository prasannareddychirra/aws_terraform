resource "aws_s3_bucket" "terraform_enterprise_s3_bucket" {
  bucket        = "cps-${lower(var.application_name)}-application-bucket-${lower(var.environment)}"
  force_destroy = true

  lifecycle {
    prevent_destroy = false
  }
  tags = merge(var.mandatory_tags, tomap({ (var.tag_definitions["resource-type"]) = "S3" }))
}


resource "aws_s3_bucket_versioning" "terraform_enterprise_s3_bucket_versioning" {
  bucket = aws_s3_bucket.terraform_enterprise_s3_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_enterprise_s3_bucket_encryption" {
  bucket = aws_s3_bucket.terraform_enterprise_s3_bucket.bucket

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = var.kms_key_arn
      sse_algorithm     = "aws:kms"
    }
  }

  lifecycle {
    prevent_destroy = false
  }

}

//resource "aws_s3_bucket_logging" "terraform_enterprise_s3_bucket_logging" {
//  bucket        = aws_s3_bucket.terraform_enterprise_s3_bucket.id
//  target_bucket = aws_s3_bucket.terraform_enterprise_s3_bucket.id
//  target_prefix = "log/"
//
//  lifecycle {
//    prevent_destroy = true
//  }
//
//}

resource "aws_s3_bucket_accelerate_configuration" "terraform_enterprise_s3_bucket_acceleration" {
  bucket = aws_s3_bucket.terraform_enterprise_s3_bucket.id
  status = "Enabled"
}
