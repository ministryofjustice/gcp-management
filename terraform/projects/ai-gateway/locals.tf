locals {
  environment_configuration = local.environment_configurations[terraform.workspace]

  ai_gateway_namespace       = "ai-gateway"
  ai_gateway_service_account = "ai-gateway"

  cloud_platform_oidc     = "https://oidc.eks.eu-west-2.amazonaws.com/id/DF366E49809688A3B16EEC29707D8C09"
  grafana_namespace       = "data-platform-monitoring-${terraform.workspace}"
  grafana_service_account = "grafana-irsa"
}
