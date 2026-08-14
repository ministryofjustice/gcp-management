resource "google_project_service" "secret_manager" {
  service = "secretmanager.googleapis.com"

  disable_on_destroy = false
}
