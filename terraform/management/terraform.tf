terraform {
  backend "gcs" {
    bucket = "moj-gcp-management-terraform"
    prefix = "management"
  }
  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.13.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "7.44.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "7.44.0"
    }
  }
}

provider "github" {
  owner = "ministryofjustice"
  app_auth {
    id              = jsondecode(data.google_secret_manager_secret_version_access.github_app.secret_data)["app_id"]
    installation_id = jsondecode(data.google_secret_manager_secret_version_access.github_app.secret_data)["installation_id"]
    pem_file        = base64decode(jsondecode(data.google_secret_manager_secret_version_access.github_app.secret_data)["private_key"])
  }
}

provider "google" {
  project = "moj-gcp-management"
  region  = "europe-west2"
}

provider "google-beta" {
  project = "moj-gcp-management"
  region  = "europe-west2"
}
