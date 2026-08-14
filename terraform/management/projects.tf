module "project" {
  for_each = local.projects

  source = "../modules/project"

  name            = each.key
  project_id      = each.key
  folder          = data.google_folder.moj_gcp.name
  billing_account = data.google_billing_account.main.billing_account
  labels          = each.value.labels
  environment     = each.value.environment
}
