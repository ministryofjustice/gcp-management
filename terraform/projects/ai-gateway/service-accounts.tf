resource "google_service_account" "ai_gateway" {
  account_id   = "ai-gateway"
  display_name = "AI Gateway"
}

resource "google_project_iam_member" "ai_gateway" {
  project = data.google_project.this.project_id
  member  = "serviceAccount:${google_service_account.ai_gateway.email}"
  role    = "roles/aiplatform.user"
}
