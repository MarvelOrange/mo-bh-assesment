locals {
  resource_prefix = "mo-bh"

  vpc_cidr = "10.0.0.0/16"
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)

  # tags = {
  #   Example    = local.name
  #   GithubRepo = "terraform-aws-vpc"
  #   GithubOrg  = "terraform-aws-modules"
  # }
}
