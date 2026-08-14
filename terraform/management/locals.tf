locals {
  project_files = {
    for filename in fileset("${path.module}/../../projects", "*.yml") :
    trimsuffix(filename, ".yml") => yamldecode(file("${path.module}/../../projects/${filename}"))
  }

  projects = merge([
    for project_name, configuration in local.project_files : {
      for environment in keys(configuration.environments) :
      "${project_name}-${environment}" => {
        environment  = environment
        labels       = configuration.labels
        project_name = project_name
      }
    }
  ]...)
}
