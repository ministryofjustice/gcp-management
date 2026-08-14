terraform {
  backend "gcs" {
    bucket = "moj-gcp-management-terraform"
    prefix = "project/ai-gateway"
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
  project = "ai-gateway-${terraform.workspace}"
  region  = "europe-west2"
}

provider "google-beta" {
  project = "ai-gateway-${terraform.workspace}"
  region  = "europe-west2"
}
