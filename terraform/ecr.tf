resource "aws_ecr_repository" "foo" {
  for_each = var.container_configs

  name                 = "${local.resource_prefix}-${each.value.name}"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = local.tags
}