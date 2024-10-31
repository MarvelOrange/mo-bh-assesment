resource "aws_ecr_repository" "ecr" {
  for_each = local.container_configs

  name                 = "${local.resource_prefix}-${each.value.name}"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = local.tags
}