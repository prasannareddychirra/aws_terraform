output "ptfe_instance_iam_role_arn" {
  value = aws_iam_role.cps_terraform_iam_role.arn
}

output "ptfe_instance_iam_role_name" {
  value = aws_iam_role.cps_terraform_iam_role.name
}

output "ptfe_instance_profile_name" {
  value = aws_iam_instance_profile.cps_terraform_iam_instance_profile.name
}