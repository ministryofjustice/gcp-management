#!/usr/bin/env bash

set -euo pipefail

# Install pre-commit hooks
uvx pre-commit install

# Install apm dependencies
apm install --frozen

# Install Google Cloud CLI
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg

echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

sudo apt-get update && sudo apt-get install google-cloud-cli

# Install yq
# shellcheck source=/dev/null
# /usr/local/bin/devcontainer-utils is not accessible from GitHub Actions
source /usr/local/bin/devcontainer-utils

get_system_architecture

get_github_latest_tag "mikefarah/yq"

curl --location "https://github.com/mikefarah/yq/releases/download/${GITHUB_LATEST_TAG}/yq_linux_${ARCHITECTURE}" \
  --output /tmp/yq

sudo install --owner=vscode --group=vscode --mode=775 /tmp/yq /usr/local/bin/yq

rm --force /tmp/yq
