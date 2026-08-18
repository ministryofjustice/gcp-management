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

resource "google_project_iam_audit_config" "this" {
  project = google_project.this.project_id
  service = "allServices"

  audit_log_config {
    log_type = "ADMIN_READ"
  }

  audit_log_config {
    log_type = "DATA_READ"
  }

  audit_log_config {
    log_type = "DATA_WRITE"
  }
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
    teams = [for team in data.github_team.deployment_reviewer : team.id]
  }
}

resource "github_repository_environment_deployment_policy" "main" {
  count = var.environment == "production" ? 1 : 0

  repository     = github_repository_environment.this.repository
  environment    = github_repository_environment.this.environment
  branch_pattern = "main"
}
