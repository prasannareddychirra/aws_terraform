//output "redis_cluster_id" {
//  value = aws_elasticache_cluster.cps_terraform_redis_cluster[count.index].id
//}

output "redis_sg_id" {
  value = aws_security_group.cps_terraform_redis_sg.id
}