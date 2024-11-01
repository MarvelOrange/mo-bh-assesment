

################################################################################
# Service
################################################################################

module "ecs_service" {
  source  = "terraform-aws-modules/ecs/aws//modules/service"
  version = "5.11.4"

  for_each = local.container_configs

  # Service
  name        = "${local.resource_prefix}-${each.key}-service"
  cluster_arn = module.ecs_cluster.arn

  # Task Definition
  requires_compatibilities = ["EC2"]
  capacity_provider_strategy = {
    # Spot instances
    ex_2 = {
      capacity_provider = module.ecs_cluster.autoscaling_capacity_providers["ex_2"].name
      weight            = 1
      base              = 1
    }
  }

  # Container definition(s)
  container_definitions = {
    ("${local.resource_prefix}-${each.key}") = {
      image = "${aws_ecr_repository.ecr[each.key].repository_url}:${each.value.tag}"
      port_mappings = [
        {
          name          = each.value.container_name
          containerPort = each.value.port
          protocol      = "tcp"
        }
      ]

      # Example image used requires access to write to root filesystem
      readonly_root_filesystem = false

      enable_cloudwatch_logging              = true
      create_cloudwatch_log_group            = true
      cloudwatch_log_group_name              = "/aws/ecs/${each.value.container_name}"
      cloudwatch_log_group_retention_in_days = 1

      log_configuration = {
        logDriver = "awslogs"
      }
    }
  }

  load_balancer = {
    service = {
      target_group_arn = module.alb.target_groups[each.key].arn
      container_name   = each.value.container_name
      container_port   = each.value.port
    }
  }

  subnet_ids = module.vpc.private_subnets

  security_group_rules = {
    ingress = {
      type                     = "ingress"
      from_port                = each.value.port
      to_port                  = each.value.port
      protocol                 = "tcp"
      description              = "Service port"
      source_security_group_id = module.alb.security_group_id
    }
    egress_all = {
      type        = "egress"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  memory = 1024
  cpu    = 512

  tags = local.tags
}
