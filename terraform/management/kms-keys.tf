# resource "google_kms_crypto_key_iam_member" "secret_manager" {
#   crypto_key_id = data.google_kms_crypto_key.terraform.id
#   role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
#   member        = "serviceAccount:service-${data.google_project.management.number}@gcp-sa-secretmanager.iam.gserviceaccount.com"

#   depends_on = [google_project_service.secret_manager]
# }
