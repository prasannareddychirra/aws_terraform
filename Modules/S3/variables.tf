variable "application_name" {
  description = "Name of the project to be prefixed to create the s3 bucket"
  type        = string
}
variable "mandatory_tags" {
  description = "mandatory_tags to be associated with the S3 bucket"
  type        = any
}

variable "kms_key_arn" {
  description = "ARN of KMS key for encryption"
  type        = string
}

variable "environment" {
  description = "Type of Environment"
  type        = string
}

variable "replication_region" {
  description = "Secondary Region of S3 bucket"
  type        = string
}
##########Optional Variables for future requests ############
variable "enable_replication" {
  description = "Enable replication"
  default     = false
  type        = bool
}

variable "tag_definitions" {
  type = map(any)
  default = {
    "resource-type" = "resource-type"
  }
  description = "Tag definitions for ease of maintenance"
}

