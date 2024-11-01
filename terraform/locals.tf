locals {
  resource_prefix = "mo-bh"

  frontend_resource_prefix = "${local.resource_prefix}-fe"
  backend_resource_prefix  = "${local.resource_prefix}-be"

  ssl_cert_acm_arn = data.aws_acm_certificate.mo_issued.arn

  ## VPC
  vpc_cidr = "10.0.0.0/16"
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)

  tags = {
    GithubRepo = "mo-bh-assesment"
    GithubOrg  = "marvelorange"
    Env        = var.env_name
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
