

################################################################################
# Service
################################################################################

# module "ecs_service" {
#   source  = "terraform-aws-modules/ecs/aws//modules/service"
#   version = "5.11.4"

#   # Service
#   name        = "${local.frontend_resource_prefix}-service"
#   cluster_arn = module.ecs_cluster.arn

#   # Task Definition
#   requires_compatibilities = ["EC2"]
#   capacity_provider_strategy = {
#     # Spot instances
#     ex_2 = {
#       capacity_provider = module.ecs_cluster.autoscaling_capacity_providers["ex_2"].name
#       weight            = 1
#       base              = 1
#     }
#   }

#   volume = {
#     my-vol = {}
#   }

#   # Container definition(s)
#   container_definitions = {
#     ("${local.frontend_resource_prefix}-cont") = {
#       image = "public.ecr.aws/ecs-sample-image/amazon-ecs-sample:latest"
#       port_mappings = [
#         {
#           name          = local.container_name
#           containerPort = local.container_port
#           protocol      = "tcp"
#         }
#       ]

#       mount_points = [
#         {
#           sourceVolume  = "my-vol",
#           containerPath = "/var/www/my-vol"
#         }
#       ]

#       entry_point = ["/usr/sbin/apache2", "-D", "FOREGROUND"]

#       # Example image used requires access to write to root filesystem
#       readonly_root_filesystem = false

#       enable_cloudwatch_logging              = true
#       create_cloudwatch_log_group            = true
#       cloudwatch_log_group_name              = "/aws/ecs/${"${local.frontend_resource_prefix}-"}/${local.container_name}"
#       cloudwatch_log_group_retention_in_days = 7

#       log_configuration = {
#         logDriver = "awslogs"
#       }
#     }
#   }

#   load_balancer = {
#     service = {
#       target_group_arn = module.alb.target_groups["ex_ecs"].arn
#       container_name   = local.container_name
#       container_port   = local.container_port
#     }
#   }

#   subnet_ids = module.vpc.private_subnets
#   security_group_rules = {
#     alb_http_ingress = {
#       type                     = "ingress"
#       from_port                = local.container_port
#       to_port                  = local.container_port
#       protocol                 = "tcp"
#       description              = "Service port"
#       source_security_group_id = module.alb.security_group_id
#     }
#   }

#   tags = local.tags
# }
