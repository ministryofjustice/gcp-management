resource "google_project" "this" {
  name                = var.name
  project_id          = "moj-gcp-${var.project_id}"
  folder_id           = var.folder
  billing_account     = var.billing_account
  auto_create_network = false
  deletion_policy     = "PREVENT"

  labels = merge(var.labels, {
    environment = var.environment
  })
}

resource "github_repository_environment" "this" {
  environment = var.name
  repository  = "gcp-management"

  dynamic "deployment_branch_policy" {
    for_each = var.environment == "production" ? [true] : []

    content {
      protected_branches     = false
      custom_branch_policies = true
    }
  }

  reviewers {
    teams = [
      data.github_team.octo_engineering_leads.id,
      data.github_team.data_platform_engineering.id
    ]
  }
}

resource "github_repository_environment_deployment_policy" "main" {
  count = var.environment == "production" ? 1 : 0

  repository     = github_repository_environment.this.repository
  environment    = github_repository_environment.this.environment
  branch_pattern = "main"
}
