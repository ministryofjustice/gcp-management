terraform {
  backend "gcs" {
    bucket = "moj-gcp-management-terraform"
    prefix = "management"
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
  project = "moj-gcp-management"
  region  = "europe-west2"
}

provider "google-beta" {
  project = "moj-gcp-management"
  region  = "europe-west2"
}
