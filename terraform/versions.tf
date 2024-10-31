# required providers for this module, requirement post terraform 0.13
terraform {
  required_version = "~> 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.6"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1" # Specify the appropriate version you want to use
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0" # Specify the desired null provider version
    }
  }
}

# default tags for this module, will be merged with tags variable
provider "aws" {
  default_tags {
    tags = {
      terraform = "true"
    }
  }
}