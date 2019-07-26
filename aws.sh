#!/usr/bin/env bash
DIR=$(dirname $0)
cd $DIR

echo "Recreating aws-secrets"
kubectl delete -n ci -f templates/aws-secrets.yml || true
kubectl create -n ci -f templates/aws-secrets.yml

echo "Recreating aws-role"
kubectl delete -n ci -f templates/aws-role.yml || true
kubectl create -n ci -f templates/aws-role.yml

echo "Recreating ci aws-ecr-cron"
kubectl delete -n ci -f templates/ecr-cron.yml || true
kubectl create -n ci -f templates/ecr-cron.yml
