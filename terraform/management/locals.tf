locals {
  project_files = {
    for filename in fileset("${path.module}/../../projects", "*.yml") :
    trimsuffix(filename, ".yml") => yamldecode(file("${path.module}/../../projects/${filename}"))
  }

  deployment_reviewer_teams = toset(flatten([
    for configuration in values(local.project_files) : flatten([
      for environment in values(configuration.environments) :
      try(environment.deployment_reviewers, [])
    ])
  ]))

  projects = merge([
    for project_name, configuration in local.project_files : {
      for environment in keys(configuration.environments) :
      "${project_name}-${environment}" => {
        deployment_reviewers = try(configuration.environments[environment].deployment_reviewers, [])
        environment          = environment
        labels               = configuration.labels
        project_name         = project_name
      }
    }
  ]...)
}
