data "github_team" "deployment_reviewer" {
  for_each = var.deployment_reviewers

  slug = each.value
}
