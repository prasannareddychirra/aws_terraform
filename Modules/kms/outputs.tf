output "tfe_kms_key" {
  value = aws_kms_key.main.id
}

output "tfe_kms_key_alias" {
  value = aws_kms_alias.main.id
}