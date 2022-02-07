# ---------------------------------------------------------------------------------------------------------------------
# ECS TASK DEFINITION USING FARGATE
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_ecs_task_definition" "task-def" {
  family                   = var.family
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.fargate_cpu
  memory                   = var.fargate_memory
  execution_role_arn       = aws_iam_role.tasks-service-role.arn
  container_definitions    = jsonencode([
    {
      cpu         = var.fargate_cpu
      image       = var.service_image_url
      memory      = var.fargate_memory
      name        = var.family
      networkMode = "awsvpc"
      healthCheck = {
        command     = ["CMD-SHELL", "curl -f http://localhost/8080/healthcheck || exit 1"],
        interval    = var.health_check_interval
        retries     = var.health_check_retries
        startPeriod = var.health_check_start_period
        timeout     = var.health_check_timeout
      }
      logConfiguration = {
        logDriver = "awslogs"
        options   = {
          awslogs-group         = var.cw_log_group
          awslogs-region        = var.aws_region
          awslogs-stream-prefix = var.cw_log_stream
        }
      }
      environment = [
        {
          name  = "spring.profiles.active"
          value = var.spring_profile
        }
            ]
      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.container_port
        }
      ]
    }
  ])
}

# ---------------------------------------------------------------------------------------------------------------------
# ECS SERVICE
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_ecs_service" "service" {
  name                               = "${var.stack}-Service"
  cluster                            = data.terraform_remote_state.ecs.outputs.cluster_id
  task_definition                    = aws_ecs_task_definition.task-def.arn
  desired_count                      = var.task_count
  launch_type                        = "FARGATE"
  deployment_minimum_healthy_percent = var.deployment_minimum_healthy_percent
  deployment_maximum_percent         = var.deployment_maximum_percent

  network_configuration {
    security_groups = [aws_security_group.task-sg.id]
    subnets         = data.terraform_remote_state.ecs.outputs.private_subnet_ids
  }

  load_balancer {
    target_group_arn = aws_alb_target_group.trgp.id
    container_name   = var.family
    container_port   = var.container_port
  }

  depends_on = [
    aws_alb_listener.alb-listener,
  ]
}

# ---------------------------------------------------------------------------------------------------------------------
# CLOUDWATCH LOG GROUP
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_cloudwatch_log_group" "service-cw-lgrp" {
  name = var.cw_log_group
}
