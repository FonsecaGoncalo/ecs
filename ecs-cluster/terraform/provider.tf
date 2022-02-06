# ---------------------------------------------------------------------------------------------------------------------
# AWS PROVIDER FOR TF CLOUD
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = "v1.1.3"
  backend "s3" {
    key = "ecs-cluster/state.tf"
    region = "eu-west-3"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.74.0"
    }
  }
}

provider "aws" {
  region  = var.aws_region
}
