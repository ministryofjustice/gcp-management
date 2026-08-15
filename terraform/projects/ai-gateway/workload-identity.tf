resource "google_iam_workload_identity_pool" "amazon_eks" {
  workload_identity_pool_id = "amazon-eks"
  display_name              = "Amazon EKS"
}

resource "google_iam_workload_identity_pool_provider" "amazon_eks" {
  workload_identity_pool_id          = google_iam_workload_identity_pool.amazon_eks.workload_identity_pool_id
  workload_identity_pool_provider_id = "data-platform"
  display_name                       = "Data Platform"

  attribute_mapping = {
    "google.subject" = "assertion.sub"
  }

  attribute_condition = "assertion.sub == \"system:serviceaccount:${local.ai_gateway_namespace}:${local.ai_gateway_service_account}\""

  oidc {
    issuer_uri = local.environment_configuration.oidc_issuer
  }
}

resource "google_service_account_iam_member" "ai_gateway_workload_identity_user" {
  service_account_id = google_service_account.ai_gateway.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "principal://iam.googleapis.com/${google_iam_workload_identity_pool.amazon_eks.name}/subject/system:serviceaccount:${local.ai_gateway_namespace}:${local.ai_gateway_service_account}"
}
