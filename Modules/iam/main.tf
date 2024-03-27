data "aws_region" "current" {}
data "aws_caller_identity" "current" {}
data "aws_partition" "current" {}

#####################################################################
################# IAM Role For TFE Instances #################
#####################################################################
resource "aws_iam_role" "cps_terraform_iam_role" {
  name               = var.cps_terraform_iam_role_name
  tags               = merge(var.mandatory_tags, tomap({ (var.tag_definitions["resource-type"]) = "ROLE" }))
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "codepipeline.amazonaws.com"
      },
      "Effect": "Allow"
    },
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "codebuild.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    },
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
  path               = "/"
}

resource "aws_iam_instance_profile" "cps_terraform_iam_instance_profile" {
  name = var.cps_terraform_iam_profile_name
  role = aws_iam_role.cps_terraform_iam_role.name
}

#####################################################################
################# IAM Role Policies For TFE Instances ###############
#####################################################################
resource "aws_iam_role_policy" "cps_terraform_iam_policy_s3_access" {
  name   = "cps-terraform-iam-policy"
  role   = aws_iam_role.cps_terraform_iam_role.id
  policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": [
          "s3:*",
          "ssm:*",
          "ssmmessages:*",
          "ec2:*",
          "kms:Encrypt",
          "kms:Decrypt",
          "kms:ReEncrypt*",
          "kms:GenerateDataKey*",
          "kms:DescribeKey",
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:DescribeLogGroups",
          "logs:DescribeLogStreams",
          "logs:PutLogEvents",
          "ec2messages:AcknowledgeMessage",
          "ec2messages:DeleteMessage",
          "ec2messages:FailMessage",
          "ec2messages:GetEndpoint",
          "ec2messages:GetMessages",
          "ec2messages:SendReply",
          "cloudwatch:getMetricData",
          "cloudwatch:listMetrics"
        ],
        "Effect": "Allow",
        "Resource": "*"
      }
    ]
  }
  EOF
}


resource "aws_iam_role_policy" "cps_terraform_iam_policy_cloudwatch_agent_server_policy" {
  name   = "cps-terraform-cw-agent-server-policy"
  role   = aws_iam_role.cps_terraform_iam_role.id
  policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "cloudwatch:PutMetricData",
                "ec2:DescribeVolumes",
                "ec2:DescribeTags"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "ssm:GetParameter"
            ],
            "Resource": "arn:aws:ssm:*:*:parameter/AmazonCloudWatch-*"
        }
    ]
  }
  EOF
}