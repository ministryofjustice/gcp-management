locals {
  environment_configuration = local.environment_configurations[terraform.workspace]

  ai_gateway_namespace       = "ai-gateway"
  ai_gateway_service_account = "ai-gateway"
}
