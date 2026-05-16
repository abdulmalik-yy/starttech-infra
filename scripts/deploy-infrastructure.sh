#!/bin/bash
set -e

echo "Deploying Infrastructure..."

cd terraform

echo "Initializing Terraform..."
terraform init

echo "Validating Terraform configuration..."
terraform validate

echo "Planning Terraform changes..."
terraform plan -out=tfplan

echo "Applying Terraform changes..."
terraform apply -auto-approve tfplan

echo "Infrastructure deployed successfully!"
