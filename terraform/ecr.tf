resource "aws_ecr_repository" "ecr" {
  for_each = local.container_configs

  name                 = "${local.resource_prefix}-${each.key}"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  force_delete = true

  tags = local.tags
}