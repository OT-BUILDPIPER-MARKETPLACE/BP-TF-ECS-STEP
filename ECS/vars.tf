variable "region" {
  type        = string
  description = "Region where resource will be created."
}

variable "cluster_name" {
  type        = string
  default     = ""
  description = "Name of the ECS cluster"
}

variable "cluster_settings" {
  description = "Configuration block(s) with cluster settings. For example, this can be used to enable CloudWatch Container Insights for a cluster"
  type        = map(string)
  default = {
    name  = "containerInsights"
    value = "disabled"
  }
}

variable "env" {
  type        = string
  default     = ""
  description = "Environment"
}

variable "fargate_capacity_providers" {
  description = "Map of Fargate capacity provider definitions to use for the cluster"
  type        = any
  default     = {
    FARGATE = {
      default_capacity_provider_strategy = {
        weight = 100
      }
    }
  }
} 

variable "services_subnet_ids" {
  type    = list
  default = []
}

variable "alb_subnets" {
  type    = list
  default = []
}

variable "backend_cpu" {
  type    = number
  default = 256
}

variable "backend_memory" {
  type    = number
  default = 512
}

variable "backend_port" {
  type    = number
  default = 80
}

variable "backend_cloudwatch_log" {
  type    = bool
  default = true
}

variable "backend_memory_reservation" {
  type    = number
  default = 100
}

variable "backend_image" {
  type    = string
  default = ""
}

variable "backend_desired_count" {
  description = "Number of instances of the task definition to place and keep running. Defaults to `0`"
  type        = number
  default     = 2
}

variable "backend_autoscaling_min_capacity" {
  description = "Minimum number of tasks to run in your service"
  type        = number
  default     = 2
}

variable "backend_autoscaling_max_capacity" {
  description = "Maximum number of tasks to run in your service"
  type        = number
  default     = 4
}

variable "backend_autoscaling_policies" {
  description = "Map of autoscaling policies to create for the service"
  type        = any
  default = {
    cpu = {
      policy_type = "TargetTrackingScaling"

      target_tracking_scaling_policy_configuration = {
        predefined_metric_specification = {
          predefined_metric_type = "ECSServiceAverageCPUUtilization"
        }
        target_value           = 50
      }
    }
    memory = {
      policy_type = "TargetTrackingScaling"

      target_tracking_scaling_policy_configuration = {
        predefined_metric_specification = {
          predefined_metric_type = "ECSServiceAverageMemoryUtilization"
        }
        target_value           = 50
      }
    }
  }
}

variable "webapp_cpu" {
  type    = number
  default = 256
}

variable "webapp_memory" {
  type    = number
  default = 512
}

variable "webapp_port" {
  type    = number
  default = 80
}

variable "webapp_cloudwatch_log" {
  type    = bool
  default = true
}

variable "webapp_memory_reservation" {
  type    = number
  default = 100
}

variable "webapp_image" {
  type    = string
  default = ""
}

variable "webapp_desired_count" {
  description = "Number of instances of the task definition to place and keep running. Defaults to `0`"
  type        = number
  default     = 2
}

variable "webapp_autoscaling_min_capacity" {
  description = "Minimum number of tasks to run in your service"
  type        = number
  default     = 2
}

variable "webapp_autoscaling_max_capacity" {
  description = "Maximum number of tasks to run in your service"
  type        = number
  default     = 4
}

variable "webapp_autoscaling_policies" {
  description = "Map of autoscaling policies to create for the service"
  type        = any
  default = {
    cpu = {
      policy_type = "TargetTrackingScaling"

      target_tracking_scaling_policy_configuration = {
        predefined_metric_specification = {
          predefined_metric_type = "ECSServiceAverageCPUUtilization"
        }
        target_value           = 50
      }
    }
    memory = {
      policy_type = "TargetTrackingScaling"

      target_tracking_scaling_policy_configuration = {
        predefined_metric_specification = {
          predefined_metric_type = "ECSServiceAverageMemoryUtilization"
        }
        target_value           = 50
      }
    }
  }
}


variable "foomill_cpu" {
  type    = number
  default = 256
}

variable "foomill_memory" {
  type    = number
  default = 512
}

variable "foomill_port" {
  type    = number
  default = 80
}

variable "foomill_cloudwatch_log" {
  type    = bool
  default = true
}

variable "foomill_memory_reservation" {
  type    = number
  default = 100
}

variable "foomill_image" {
  type    = string
  default = ""
}

variable "foomill_desired_count" {
  description = "Number of instances of the task definition to place and keep running. Defaults to `0`"
  type        = number
  default     = 2
}

variable "foomill_autoscaling_min_capacity" {
  description = "Minimum number of tasks to run in your service"
  type        = number
  default     = 2
}

variable "foomill_autoscaling_max_capacity" {
  description = "Maximum number of tasks to run in your service"
  type        = number
  default     = 4
}

variable "foomill_autoscaling_policies" {
  description = "Map of autoscaling policies to create for the service"
  type        = any
  default = {
    cpu = {
      policy_type = "TargetTrackingScaling"

      target_tracking_scaling_policy_configuration = {
        predefined_metric_specification = {
          predefined_metric_type = "ECSServiceAverageCPUUtilization"
        }
        target_value           = 50
      }
    }
    memory = {
      policy_type = "TargetTrackingScaling"

      target_tracking_scaling_policy_configuration = {
        predefined_metric_specification = {
          predefined_metric_type = "ECSServiceAverageMemoryUtilization"
        }
        target_value           = 50
      }
    }
  }
}



variable "admin_cpu" {
  type    = number
  default = 256
}

variable "admin_memory" {
  type    = number
  default = 512
}

variable "admin_port" {
  type    = number
  default = 80
}

variable "admin_cloudwatch_log" {
  type    = bool
  default = true
}

variable "admin_memory_reservation" {
  type    = number
  default = 100
}

variable "admin_image" {
  type    = string
  default = ""
}

variable "admin_desired_count" {
  description = "Number of instances of the task definition to place and keep running. Defaults to `0`"
  type        = number
  default     = 2
}

variable "admin_autoscaling_min_capacity" {
  description = "Minimum number of tasks to run in your service"
  type        = number
  default     = 2
}

variable "admin_autoscaling_max_capacity" {
  description = "Maximum number of tasks to run in your service"
  type        = number
  default     = 4
}

variable "admin_autoscaling_policies" {
  description = "Map of autoscaling policies to create for the service"
  type        = any
  default = {
    cpu = {
      policy_type = "TargetTrackingScaling"

      target_tracking_scaling_policy_configuration = {
        predefined_metric_specification = {
          predefined_metric_type = "ECSServiceAverageCPUUtilization"
        }
        target_value           = 50
      }
    }
    memory = {
      policy_type = "TargetTrackingScaling"

      target_tracking_scaling_policy_configuration = {
        predefined_metric_specification = {
          predefined_metric_type = "ECSServiceAverageMemoryUtilization"
        }
        target_value           = 50
      }
    }
  }
}
