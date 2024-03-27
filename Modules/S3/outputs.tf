#This solution, non-production-ready template describes AWS Codepipeline based CICD Pipeline for terraform code deployment.
#© 2023 Amazon Web Services, Inc. or its affiliates. All Rights Reserved.
#This AWS Content is provided subject to the terms of the AWS Customer Agreement available at
#http://aws.amazon.com/agreement or other written agreement between Customer and either
#Amazon Web Services, Inc. or Amazon Web Services EMEA SARL or both.

output "ptfe_bucket_arn" {
  value       = aws_s3_bucket.terraform_enterprise_s3_bucket.arn
  description = "The ARN of the S3 Bucket"
}

output "ptfe_bucket_name" {
  value = aws_s3_bucket.terraform_enterprise_s3_bucket.id
}

output "ptfe_bucket_s3_name" {
  value = aws_s3_bucket.terraform_enterprise_s3_bucket.bucket_regional_domain_name
}