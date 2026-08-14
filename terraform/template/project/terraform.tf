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
}

provider "google" {
  project = "PROJECT_NAME-${terraform.workspace}"
  region  = "europe-west2"
}

provider "google-beta" {
  project = "PROJECT_NAME-${terraform.workspace}"
  region  = "europe-west2"
}
