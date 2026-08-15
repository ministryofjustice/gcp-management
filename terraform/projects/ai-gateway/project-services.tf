locals {
  project_services = [
    "aiplatform.googleapis.com",
    "iamcredentials.googleapis.com"
  ]
}

resource "google_project_service" "services" {
  for_each = toset(local.project_services)
  service  = each.key

  disable_on_destroy = false
}
