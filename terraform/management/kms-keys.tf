resource "google_kms_crypto_key_iam_member" "secret_manager" {
  crypto_key_id = data.google_kms_crypto_key.terraform.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member        = google_project_service_identity.secret_manager.member
}
