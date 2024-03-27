data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

resource "aws_kms_key" "main" {
  description              = "Terraform Enterprise KMS key for EBS, RDS, Elastic Cache and S3 encryption"
  deletion_window_in_days  = 30
  key_usage                = "ENCRYPT_DECRYPT"
  customer_master_key_spec = "SYMMETRIC_DEFAULT"
  policy                   = data.aws_iam_policy_document.kms_key.json
  is_enabled               = true
  enable_key_rotation      = true
  tags = merge(var.mandatory_tags, tomap({ "resource-type" = "KMS" }))
}

resource "aws_kms_alias" "main" {
  name          = "alias/terraform-enterprise-${lower(var.environment)}-key"
  target_key_id = aws_kms_key.main.key_id
}

data "aws_iam_policy_document" "kms_key" {
  statement {
    sid    = "Allow service-linked role use of the CMK"
    effect = "Allow"
    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
      ]
    }
    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:DescribeKey"
    ]
    resources = [
      "*"
    ]
  }
  statement {
    sid    = "Allow attachment of persistent resources for ASG"
    effect = "Allow"
    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
      ]
    }
    actions = [
      "kms:CreateGrant"
    ]
    resources = [
      "*"
    ]
    condition {
      test     = "Bool"
      variable = "kms:GrantIsForAWSResource"
      values   = ["true"]
    }
  }
  statement {
    sid    = "Enable IAM Root User Permissions"
    effect = "Allow"
    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
      ]
    }
    actions = [
      "kms:*"
    ]
    resources = [
      "*"
    ]
  }
  statement {
    sid    = "Allow administration of the key"
    effect = "Allow"
    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/antm-sec",
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/antm-ees-admin"
      ]
    }
    actions = [
      "kms:Create*",
      "kms:Describe*",
      "kms:Enable*",
      "kms:List*",
      "kms:Put*",
      "kms:Update*",
      "kms:Revoke*",
      "kms:Disable*",
      "kms:Get*",
      "kms:Delete*",
      "kms:ScheduleKeyDeletion",
      "kms:CancelKeyDeletion"
    ]
    resources = [
      "*"
    ]
  }
  statement {
    sid    = "Allow use of the key"
    effect = "Allow"
    principals {
      type = "AWS"
      identifiers = [
        "*"
      ]
    }
    actions = [
      "kms:DescribeKey",
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*"
    ]
    resources = [
      "*"
    ]
    condition {
      test     = "StringEquals"
      variable = "kms:ViaService"
      values = [
        "ebs.${data.aws_region.current.name}.amazonaws.com",
        "s3.${data.aws_region.current.name}.amazonaws.com",
        "autoscaling.${data.aws_region.current.name}.amazonaws.com",
        "ec2.${data.aws_region.current.name}.amazonaws.com",
        "lambda.${data.aws_region.current.name}.amazonaws.com",
        "batch.${data.aws_region.current.name}.amazonaws.com",
        "sqs.${data.aws_region.current.name}.amazonaws.com",
        "states.${data.aws_region.current.name}.amazonaws.com",
        "logs.${data.aws_region.current.name}.amazonaws.com",
        "rds.${data.aws_region.current.name}.amazonaws.com",
        "elasticache.${data.aws_region.current.name}.amazonaws.com"
      ]
    }
  }
  statement {
  sid    = "Allow use of the key to cloudeng temporarily"
  effect = "Allow"
  principals {
    type = "AWS"
    identifiers = [
      "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/antm-cloudeng",
    ]
  }
  actions = [
    "kms:DescribeKey",
    "kms:Encrypt",
    "kms:Decrypt",
    "kms:ReEncrypt*",
    "kms:GenerateDataKey*"
  ]
  resources = [
    "*"
  ]

}

  statement {
    sid    = "Allow attachment of persistent resources"
    effect = "Allow"
    principals {
      type = "AWS"
      identifiers = [
        "*"
      ]
    }
    actions = [
      "kms:CreateGrant",
      "kms:ListGrants"
    ]
    resources = [
      "*"
    ]
    condition {
      test     = "Bool"
      variable = "kms:GrantIsForAWSResource"
      values   = ["true"]
    }
  }
}
