variable "cps_terraform_iam_role_name" {
  type        = string
  description = "IAM Terraform Instance Role"
}

variable "mandatory_tags" {
  type        = any
  description = "Mandatory Tags"
}

variable "tag_definitions" {
  type = map(any)
  default = {
    "resource-type" = "resource-type"
  }
  description = "Tag definitions for ease of maintenance"
}

variable "cps_terraform_iam_profile_name" {
  description = "The IAM Instance Profile to launch the instance with"
  type        = string
}