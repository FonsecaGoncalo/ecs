# ---------------------------------------------------------------------------------------------------------------------
# Remote States
# ---------------------------------------------------------------------------------------------------------------------

data "terraform_remote_state" "ecs" {
  backend = "s3"
  config  = {
    bucket = var.ecs_cluster_state_bucket
    key    = "ecs-cluster/terraform.tfstate"
    region = "eu-west-3"
  }
}
