locals {
  resource_prefix = "mo-bh"

  frontend_resource_prefix = "${local.resource_prefix}-fe"
  backend_resource_prefix  = "${local.resource_prefix}-be"

  ## VPC
  vpc_cidr = "10.0.0.0/16"
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)

  ## ECS
  container_name = "ecs-sample"
  container_port = 80

  tags = {
    GithubRepo = "mo-bh-assesment"
    GithubOrg  = "marvelorange"
  }
}
