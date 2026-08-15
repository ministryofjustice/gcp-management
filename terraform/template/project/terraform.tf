terraform {
  backend "gcs" {
    bucket = "moj-gcp-management-terraform"
    prefix = "project/PROJECT_NAME"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.44.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "7.44.0"
    }
  }
  required_version = "~> 1.10"
}

provider "google" {
  project               = "moj-gcp-PROJECT_NAME-${terraform.workspace}"
  region                = "europe-west2"
  user_project_override = true
}

provider "google-beta" {
  project               = "moj-gcp-PROJECT_NAME-${terraform.workspace}"
  region                = "europe-west2"
  user_project_override = true
}
