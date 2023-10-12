locals {
   services_subnet_ids = var.services_subnet_ids 
   alb_subnets = var.alb_subnets
}

module "ecs" {
  source = "terraform-aws-modules/ecs/aws"

  cluster_name               = "${var.env}-${var.cluster_name}-cluster"
  fargate_capacity_providers = var.fargate_capacity_providers
	cluster_settings           = var.cluster_settings

  services = {
    "${var.env}-${var.cluster_name}-backend-service" = {
      cpu    = var.backend_cpu
      memory = var.backend_memory
			desired_count             = var.backend_desired_count
			autoscaling_min_capacity  = var.backend_autoscaling_min_capacity
			autoscaling_max_capacity  = var.backend_autoscaling_max_capacity
      autoscaling_policies      = var.backend_autoscaling_policies
      container_definitions = {
        "${var.env}-${var.cluster_name}-backend" = {
          essential = true
          image     = var.backend_image
          port_mappings = [
            {
              name          = "${var.env}-${var.cluster_name}-backend"
              containerPort = var.backend_port
              protocol      = "tcp"
            }
          ]
          readonly_root_filesystem = false
          enable_cloudwatch_logging = var.backend_cloudwatch_log
          memory_reservation = var.backend_memory_reservation
        }
      }
      subnet_ids = local.services_subnet_ids
      load_balancer = {
        frontend = {
          target_group_arn = element(module.alb.target_group_arns, 0)
          container_name   = "${var.env}-${var.cluster_name}-backend"
          container_port   = var.backend_port
        }
      }
      security_group_rules = {
        "${var.env}-${var.cluster_name}-backend" = {
          type                     = "ingress"
          from_port                = var.backend_port
          to_port                  = var.backend_port
          protocol                 = "tcp"
          description              = "backend Service port"
          source_security_group_id = module.alb_sg.security_group_id
        }
        egress_all = {
          type        = "egress"
          from_port   = 0
          to_port     = 0
          protocol    = "-1"
          cidr_blocks = ["0.0.0.0/0"]
        }
      }
    },
    "${var.env}-${var.cluster_name}-webapp-service" = {
      cpu    = var.webapp_cpu
      memory = var.webapp_memory
			desired_count             = var.webapp_desired_count
			autoscaling_min_capacity  = var.webapp_autoscaling_min_capacity
			autoscaling_max_capacity  = var.webapp_autoscaling_max_capacity
      autoscaling_policies      = var.webapp_autoscaling_policies
      container_definitions = {
        "${var.env}-${var.cluster_name}-webapp" = {
          essential = true
          image     = var.webapp_image
          port_mappings = [
            {
              name          = "${var.env}-${var.cluster_name}-webapp"
              containerPort = var.webapp_port
              protocol      = "tcp"
            }
          ]
          readonly_root_filesystem = false
          enable_cloudwatch_logging = var.webapp_cloudwatch_log
          memory_reservation = var.webapp_memory_reservation
        }
      }
      subnet_ids = local.services_subnet_ids
      load_balancer = {
        frontend = {
          target_group_arn = element(module.alb.target_group_arns, 1)
          container_name   = "${var.env}-${var.cluster_name}-webapp"
          container_port   = var.webapp_port
        }
      }
      security_group_rules = {
        "${var.env}-${var.cluster_name}-webapp" = {
          type                     = "ingress"
          from_port                = var.webapp_port
          to_port                  = var.webapp_port
          protocol                 = "tcp"
          description              = "webapp Service port"
          source_security_group_id = module.alb_sg.security_group_id
        }
        egress_all = {
          type        = "egress"
          from_port   = 0
          to_port     = 0
          protocol    = "-1"
          cidr_blocks = ["0.0.0.0/0"]
        }
      }
    },
    "${var.env}-${var.cluster_name}-admin-service" = {
      cpu    = var.admin_cpu
      memory = var.admin_memory
			desired_count             = var.admin_desired_count
			autoscaling_min_capacity  = var.admin_autoscaling_min_capacity
			autoscaling_max_capacity  = var.admin_autoscaling_max_capacity
      autoscaling_policies      = var.admin_autoscaling_policies
      container_definitions = {
        "${var.env}-${var.cluster_name}-admin" = {
          essential = true
          image     = var.admin_image
          port_mappings = [
            {
              name          = "${var.env}-${var.cluster_name}-admin"
              containerPort = var.admin_port
              protocol      = "tcp"
            }
          ]
          readonly_root_filesystem = false
          enable_cloudwatch_logging = var.admin_cloudwatch_log
          memory_reservation = var.admin_memory_reservation
        }
      }
      subnet_ids = local.services_subnet_ids
      load_balancer = {
        frontend = {
          target_group_arn = element(module.alb.target_group_arns, 2)
          container_name   = "${var.env}-${var.cluster_name}-admin"
          container_port   = var.admin_port
        }
      }
      security_group_rules = {
        "${var.env}-${var.cluster_name}-admin" = {
          type                     = "ingress"
          from_port                = var.admin_port
          to_port                  = var.admin_port
          protocol                 = "tcp"
          description              = "admin Service port"
          source_security_group_id = module.alb_sg.security_group_id
        }
        egress_all = {
          type        = "egress"
          from_port   = 0
          to_port     = 0
          protocol    = "-1"
          cidr_blocks = ["0.0.0.0/0"]
        }
      }
    },
    "${var.env}-${var.cluster_name}-foomill-service" = {
      cpu    = var.foomill_cpu
      memory = var.foomill_memory
			desired_count             = var.foomill_desired_count
			autoscaling_min_capacity  = var.foomill_autoscaling_min_capacity
			autoscaling_max_capacity  = var.foomill_autoscaling_max_capacity
      autoscaling_policies      = var.foomill_autoscaling_policies
      container_definitions = {
        "${var.env}-${var.cluster_name}-foomill" = {
          essential = true
          image     = var.foomill_image
          port_mappings = [
            {
              name          = "${var.env}-${var.cluster_name}-foomill"
              containerPort = var.foomill_port
              protocol      = "tcp"
            }
          ]
          readonly_root_filesystem = false
          enable_cloudwatch_logging = var.foomill_cloudwatch_log
          memory_reservation = var.foomill_memory_reservation
        }
      }
      subnet_ids = local.services_subnet_ids
      load_balancer = {
        frontend = {
          target_group_arn = element(module.alb.target_group_arns, 3)
          container_name   = "${var.env}-${var.cluster_name}-foomill"
          container_port   = var.foomill_port
        }
      }
      security_group_rules = {
        "${var.env}-${var.cluster_name}-foomill" = {
          type                     = "ingress"
          from_port                = var.foomill_port
          to_port                  = var.foomill_port
          protocol                 = "tcp"
          description              = "foomill Service port"
          source_security_group_id = module.alb_sg.security_group_id
        }
        egress_all = {
          type        = "egress"
          from_port   = 0
          to_port     = 0
          protocol    = "-1"
          cidr_blocks = ["0.0.0.0/0"]
        }
      }
    }
  }
}

data "aws_subnet" "this" {
  id = element(local.alb_subnets, 0)
}

module "alb_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.0"

  name        = "${var.env}-${var.cluster_name}-alb-sg"
  description = "Service security group alb"
  vpc_id      = data.aws_subnet.this.vpc_id

  ingress_rules       = ["http-80-tcp","https-443-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]

  egress_rules       = ["all-all"]
  egress_cidr_blocks = ["0.0.0.0/0"]

}

module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 8.0"

  name = "${var.env}-${var.cluster_name}-alb"

  load_balancer_type = "application"

  vpc_id          = data.aws_subnet.this.vpc_id
  subnets         = local.alb_subnets
  security_groups = [module.alb_sg.security_group_id]

  https_listeners = [
    {
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = var.acm_certificate_arn
      target_group_index = 1
    }
  ]

  http_tcp_listeners = [
    {
      port        = 80
      protocol    = "HTTP"
      action_type = "redirect"
      redirect = {
        port        = "443"
        protocol    = "HTTPS"
        status_code = "HTTP_301"
      }
    }
  ]

  https_listener_rules = [
    {
      https_listener_index    = 0
      priority                = 1
      actions = [{
        type         = "forward"
        target_group_index = 0
      }]

      conditions = [{
        host_headers = [var.backend_domain]
      }]
    },
    {
      https_listener_index    = 0
      priority                = 2
      actions = [{
        type         = "forward"
        target_group_index = 1
      }]
      health_check = {
        enabled             = true
        interval            = 60
        path                = "/"
        port                = "traffic-port"
        healthy_threshold   = 2
        unhealthy_threshold = 10
        timeout             = 5
        protocol            = "HTTP"
        matcher             = "200"
      }
      conditions = [{
        host_headers = [var.webapp_domain]
      }]
    },
    {
      https_listener_index    = 0
      priority                = 3
      actions = [{
        type         = "forward"
        target_group_index = 2
      }]

      conditions = [{
        host_headers = [var.admin_domain]
      }]
    },
    {
      https_listener_index    = 0
      priority                = 4
      actions = [{
        type         = "forward"
        target_group_index = 3
      }]

      conditions = [{
        host_headers = [var.recipe_domain]
      }]
    }
  ]

  target_groups = [
    {
      name             = "${var.env}-${var.cluster_name}-backend-service"
      backend_protocol = "HTTP"
      backend_port     = var.backend_port
      target_type      = "ip"
    },
    {
      name             = "${var.env}-${var.cluster_name}-webapp-service"
      backend_protocol = "HTTP"
      backend_port     = var.webapp_port
      target_type      = "ip"
    },
    {
      name             = "${var.env}-${var.cluster_name}-admin-service"
      backend_protocol = "HTTP"
      backend_port     = var.admin_port
      target_type      = "ip"
    },
    {
      name             = "${var.env}-${var.cluster_name}-foomill-service"
      backend_protocol = "HTTP"
      backend_port     = var.foomill_port
      target_type      = "ip"
    }
  ]
}