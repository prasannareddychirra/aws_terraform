output "rds_cluster_endpoint" {
  value = aws_rds_cluster.cps_terraform_rds_cluster.endpoint
}
output "rds_cluster_identifier" {
  value = aws_rds_cluster.cps_terraform_rds_cluster.cluster_identifier
}
output "rds_cluster_name" {
  value = aws_rds_cluster.cps_terraform_rds_cluster.database_name
}
//output "rds_instance_endpoint" {
//  value = aws_rds_cluster_instance.cps_terraform_rds_instance[count.index].endpoint
//}
//output "rds_instance_name" {
//  value = aws_rds_cluster_instance.cps_terraform_rds_instance[count.index].id
//}
output "rds_cluster_security_group_id" {
  value = aws_security_group.ptfe_db_sg.id
}
output "rds_cluster_parameter_group_id" {
  value = aws_rds_cluster.cps_terraform_rds_cluster.id
}
output "rds_cluster_subnet_group_id" {
  value = aws_rds_cluster.cps_terraform_rds_cluster.id
}

output "rds_cluster_security_group_name" {
  value = aws_security_group.ptfe_db_sg.name
}