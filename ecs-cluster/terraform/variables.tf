# ---------------------------------------------------------------------------------------------------------------------
# VARIABLES
# ---------------------------------------------------------------------------------------------------------------------

variable "aws_region" {
  description = "The AWS region to create resources in."
  default     = "eu-west-3"
}

variable "stack" {
  description = "Name of the stack."
  default     = "GameDay"
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default     = "172.17.0.0/16"
}

variable "az_count" {
  description = "Number of AZs to cover in a given AWS region"
  default     = "2"
}

variable "aws_ecr" {
  description = "AWS ECR "
}

variable "image_repo_name" {
  description = "Image repo name"
  type = string
}



