# resource "google_project" "project" {
#   for_each = local.projects

#   name            = each.key
#   project_id      = each.key
#   folder_id       = data.google_folder.moj_gcp.name
#   billing_account = data.google_billing_account.main.billing_account

#   labels = merge(each.value.labels, {
#     environment = each.value.environment
#   })
# }
