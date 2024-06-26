# ---------------------------------------------------------------------------------------------------------------------
# ECS CLUSTER
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_ecs_cluster" "ecs-cluster" {
  name = "${var.stack}-Cluster"
}

## Outputs
output "cluster_id" {
  value = aws_ecs_cluster.ecs-cluster.id
}
