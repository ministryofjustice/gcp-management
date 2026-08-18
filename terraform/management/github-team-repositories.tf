resource "github_team_repository" "deployment_reviewer" {
  for_each = data.github_team.deployment_reviewer

  team_id    = each.value.id
  repository = "gcp-management"
  permission = "push"
}
