# ---------------------------------------------------------------------------------------------------------------------
# VARIABLES
# ---------------------------------------------------------------------------------------------------------------------

variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "eu-west-3"
}

variable "aws_profile" {
  description = "AWS profile"
  default     = "default"
}

variable "stack" {
  description = "Name of the stack."
  default     = "service-poc"
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default     = "172.17.0.0/16"
}

variable "az_count" {
  description = "Number of AZs to cover in a given AWS region"
  default     = "2"
}

variable "family" {
  description = "Family of the Task Definition"
  default     = "service-poc"
}

variable "container_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  default     = 8080
}

variable "task_count" {
  description = "Number of ECS tasks to run"
  default     = 3
}

variable "fargate_cpu" {
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
  default     = 512
}

variable "fargate_memory" {
  description = "Fargate instance memory to provision (in MiB)"
  default     = 1024
}

variable "fargate-task-service-role" {
  description = "Name of the stack"
  default     = "ecs-poc"
}

variable "cw_log_group" {
  description = "CloudWatch Log Group"
  default     = "GameDay"
}

variable "cw_log_stream" {
  description = "CloudWatch Log Stream"
  default     = "fargate"
}

variable "spring_profile" {
  description = "Active Spring Profile"
  default     = "default"
}

variable "service_image_url" {
  description = "Image url to be used in the task definition"
}

variable "deployment_minimum_healthy_percent" {
  description = "Lower limit of the number of running tasks that must remain running and healthy in a service during a deployment."
  default     = 50
}

variable "deployment_maximum_percent" {
  description = "Upper limit of the number of running tasks that can be running in a service during a deployment"
  default     = 100
}

variable "health_check_interval" {
  description = "The time period in seconds between each health check execution"
  default     = 30
}

variable "health_check_retries" {
  description = "The number of times to retry a failed health check before the container is considered unhealthy"
  default     = 3
}

variable "health_check_start_period" {
  description = "The grace period in seconds to provide containers time to bootstrap before failed health checks"
  default     = 30
}

variable "health_check_timeout" {
  description = "The time period in seconds to wait for a health check to succeed before it is considered a failure"
  default     = 10
}