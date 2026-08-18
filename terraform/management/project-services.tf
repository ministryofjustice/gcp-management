resource "google_project_service" "secret_manager" {
  service = "secretmanager.googleapis.com"

  disable_on_destroy = false
}

resource "google_project_service_identity" "secret_manager" {
  provider = google-beta

  service = google_project_service.secret_manager.service
}
