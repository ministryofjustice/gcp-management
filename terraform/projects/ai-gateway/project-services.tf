locals {
  project_services = [
    "aiplatform.googleapis.com",
    "iam.googleapis.com",
    "iamcredentials.googleapis.com",
    "monitoring.googleapis.com"
  ]
}

resource "google_project_service" "services" {
  for_each = toset(local.project_services)
  service  = each.key

  disable_on_destroy = false
}
