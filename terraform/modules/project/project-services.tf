locals {
  project_services = [
    "cloudresourcemanager.googleapis.com",
    "serviceusage.googleapis.com"
  ]
}

resource "google_project_service" "services" {
  for_each = toset(local.project_services)

  project = google_project.this.project_id
  service = each.key

  disable_on_destroy = false
}
