data "aws_availability_zones" "available" {}

data "aws_ssm_parameter" "ecs_optimized_ami" {
  name = "/aws/service/ecs/optimized-ami/amazon-linux-2/recommended"
}

data "aws_acm_certificate" "mo_issued" {
  domain   = "*.marvelorange.co.uk"
  statuses = ["ISSUED"]
}

data "aws_route53_zone" "selected" {
  name = "marvelorange.co.uk"
}