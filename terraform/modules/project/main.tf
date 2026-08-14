resource "google_project" "project" {
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
