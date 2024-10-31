locals {
  resource_prefix = "mo-bh"

  frontend_resource_prefix = "${local.resource_prefix}-fe"
  frontend_repo_url        = aws_ecr_repository.ecr["frontend"].repository_url

  backend_resource_prefix = "${local.resource_prefix}-be"
  backend_repo_url        = aws_ecr_repository.ecr["backend"].repository_url

  ssl_cert_acm_arn = data.aws_acm_certificate.mo_issued.arn

  ## VPC
  vpc_cidr = "10.0.0.0/16"
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)

  tags = {
    GithubRepo = "mo-bh-assesment"
    GithubOrg  = "marvelorange"
  }

  container_configs = {
    frontend = {
      container_name = "${local.resource_prefix}-frontend"
      port           = 80
      tag            = var.frontend_docker_tag
    }
    backend = {
      container_name = "${local.resource_prefix}-backend"
      port           = 8080
      tag            = var.backend_docker_tag
    }
  }
}
