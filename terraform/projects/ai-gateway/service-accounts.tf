resource "google_service_account" "ai_gateway" {
  account_id   = "ai-gateway"
  display_name = "AI Gateway"

  depends_on = [google_project_service.services]
}

resource "google_project_iam_member" "ai_gateway" {
  project = data.google_project.this.project_id
  member  = "serviceAccount:${google_service_account.ai_gateway.email}"
  role    = "roles/aiplatform.user"
}

resource "google_service_account" "grafana" {
  account_id   = "grafana"
  display_name = "Grafana"

  depends_on = [google_project_service.services]
}

resource "google_project_iam_member" "grafana" {
  project = data.google_project.this.project_id
  member  = "serviceAccount:${google_service_account.grafana.email}"
  role    = "roles/monitoring.viewer"
}
