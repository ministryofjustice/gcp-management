data "google_billing_account" "main" {
  billing_account = "017155-2D008B-384D08"
}

data "google_organization" "moj" {
  organization = "706768133544"
}

data "google_folder" "moj_gcp" {
  folder = "989817083373"
}

data "google_kms_key_ring" "terraform" {
  name     = "terraform"
  location = "europe-west2"
}

data "google_kms_crypto_key" "terraform" {
  name     = "terraform"
  key_ring = data.google_kms_key_ring.terraform.id
}
