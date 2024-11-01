output "ecr_urls" {
  description = "ECR Urls"
  value       = { for k, v in aws_ecr_repository.ecr : k => v.repository_url }
}
