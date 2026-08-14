# resource "google_secret_manager_secret" "github_app" {
#   secret_id = "github-app"

#   replication {
#     user_managed {
#       replicas {
#         location = "europe-west2"

#         customer_managed_encryption {
#           kms_key_name = data.google_kms_crypto_key.terraform.id
#         }
#       }
#     }
#   }

#   deletion_protection = true

#   depends_on = [google_kms_crypto_key_iam_member.secret_manager]
# }
