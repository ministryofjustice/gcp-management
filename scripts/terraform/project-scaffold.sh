#!/usr/bin/env bash

for project in projects/*.yml; do
  project_name=$(basename "${project}" .yml)

  mkdir --parents "terraform/projects/${project_name}"

  cp --force terraform/template/project/terraform.tf "terraform/projects/${project_name}/terraform.tf"

  sed -i "s/PROJECT_NAME/${project_name}/g" "terraform/projects/${project_name}/terraform.tf"

  cd "terraform/projects/${project_name}"

  terraform init -upgrade -backend=false
done
