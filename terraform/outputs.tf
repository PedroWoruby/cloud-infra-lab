##############################################
# Outputs — o que o Terraform mostra depois do apply
##############################################

output "vpc_id" {
  description = "ID da VPC criada"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "IDs das subnets públicas"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "IDs das subnets privadas"
  value       = aws_subnet.private[*].id
}

output "web_security_group_id" {
  description = "ID do Security Group da camada web"
  value       = aws_security_group.web.id
}

output "artifacts_bucket_name" {
  description = "Nome do bucket S3 de artefatos/logs"
  value       = aws_s3_bucket.artifacts.bucket
}

output "app_role_arn" {
  description = "ARN da IAM Role usada pela aplicação"
  value       = aws_iam_role.app_role.arn
}
