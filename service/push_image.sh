#!/usr/bin/env bash

aws ecr get-login-password --region eu-west-3 | docker login --username AWS --password-stdin 433743481407.dkr.ecr.eu-west-3.amazonaws.com

docker build --platform linux/amd64 -t ecs-poc-service-repo .

docker tag ecs-poc-service-repo:latest 433743481407.dkr.ecr.eu-west-3.amazonaws.com/ecs-poc-service-repo:2

docker push 433743481407.dkr.ecr.eu-west-3.amazonaws.com/ecs-poc-service-repo:2