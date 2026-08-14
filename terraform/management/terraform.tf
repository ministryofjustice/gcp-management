terraform {
  backend "gcs" {
    project = "moj-gcp-management"
    bucket  = "moj-gcp-management-terraform"
    prefix  = "management"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.44.0"
    }
  }
}

provider "google" {}
