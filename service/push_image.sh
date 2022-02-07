#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

ACCOUNT_ID=$1
REGION=$2
REPOSITORY=$3
IMAGE_TAG=$4

aws ecr get-login-password --region "${REGION}" | docker login --username AWS --password-stdin "${ACCOUNT_ID}".dkr.ecr."${REGION}".amazonaws.com

docker build --platform linux/amd64 -t "${REPOSITORY}" .

docker tag "${REPOSITORY}":latest "${ACCOUNT_ID}".dkr.ecr."${REGION}".amazonaws.com/"${REPOSITORY}":"${IMAGE_TAG}"

docker push "${IMAGE_URL}"