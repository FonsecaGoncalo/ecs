data "terraform_remote_state" "ecs" {
  backend = "s3"
  config  = {
    bucket = "tf-goncalo"
    key    = "ecs-cluster/state.tf"
    region = "eu-west-3"
  }
}
