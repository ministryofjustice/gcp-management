# output "ai_gateway_service_account_email" {
#   description = "Google service account impersonated by the AI Gateway EKS workload."
#   value       = google_service_account.ai_gateway.email
# }

# output "ai_gateway_workload_identity_audience" {
#   description = "Audience required on the projected EKS service account token."
#   value       = "//iam.googleapis.com/${google_iam_workload_identity_pool_provider.eks.name}"
# }

# output "ai_gateway_external_account_configuration" {
#   description = "Non-secret external-account configuration to mount in the AI Gateway pod."
#   value = jsonencode({
#     type                              = "external_account"
#     audience                          = "//iam.googleapis.com/${google_iam_workload_identity_pool_provider.eks.name}"
#     subject_token_type                = "urn:ietf:params:oauth:token-type:jwt"
#     token_url                         = "https://sts.googleapis.com/v1/token"
#     service_account_impersonation_url = "https://iamcredentials.googleapis.com/v1/projects/-/serviceAccounts/${google_service_account.ai_gateway.email}:generateAccessToken"
#     credential_source = {
#       file = var.kubernetes_service_account_token_path
#     }
#   })
# }
