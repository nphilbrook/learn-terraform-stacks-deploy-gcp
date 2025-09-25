# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

resource "random_pet" "function_name" {
  prefix = "stacks"
  length = 2
}

# data "archive_file" "function_zip" {
#   type        = "zip"
#   source_dir  = "${path.module}/hello-world"
#   output_path = "/tmp/hello-world.zip"
# }

# Because the apply environment may be different from the plan environment, pass
# the file contents through the `data.local_file.function_zip` data source,
# whose value is stored in the plan.
# data "local_file" "function_zip" {
#   filename = data.archive_file.function_zip.output_path
# }

# resource "local_file" "function_zip" {
#   filename       = "/tmp/final.zip"
#   content_base64 = data.local_file.function_zip.content_base64
# }

# resource "google_storage_bucket_object" "function_zip" {
#   name           = "hello-world.zip"
#   bucket         = var.storage_bucket_name
#   source         = local_file.function_zip.filename
#   # detect_md5hash = local_file.function_zip.content_md5
# }

# resource "google_cloudfunctions2_function" "function" {
#   name        = random_pet.function_name.id
#   location    = var.region
#   description = "Hello World Function"

#   build_config {
#     runtime     = "nodejs22"
#     entry_point = "helloWorld"

#     source {
#       storage_source {
#         bucket = var.storage_bucket_name
#         object = google_storage_bucket_object.function_zip.name
#       }
#     }
#   }

#   service_config {
#     available_memory   = "256M"
#     timeout_seconds    = 60
#     ingress_settings   = "ALLOW_ALL"
#     max_instance_count = 1
#   }
# }

# # Allow authenticated invocation of the function
# # To invoke the function via gcloud:
# # gcloud functions call ${google_cloudfunctions2_function.function.name} \
# #   --region=${google_cloudfunctions2_function.function.location} \
# #   --data='{"name":"World"}' \
# #   --gen2
# #
# # Or via HTTP with auth (use the function URL, not the Cloud Run service URL):
# # curl -H "Authorization: Bearer $(gcloud auth print-access-token)" \
# #   -H "Content-Type: application/json" \
# #   -d '{"name":"World"}' \
# #   https://${google_cloudfunctions2_function.function.location}-${google_cloudfunctions2_function.function.project}.cloudfunctions.net/${google_cloudfunctions2_function.function.name}
# # This may not work based on your orginaziton's policies. 

# # Grant permission on the underlying Cloud Run service
# resource "google_cloud_run_service_iam_member" "invoker" {
#   count    = var.function_invoker_principal != null ? 1 : 0
#   project  = google_cloudfunctions2_function.function.project
#   location = google_cloudfunctions2_function.function.location
#   service  = google_cloudfunctions2_function.function.name
#   role     = "roles/run.invoker"
#   member   = var.function_invoker_principal
# }

# # Grant permission on the Cloud Function itself (for HTTP trigger access)
# resource "google_cloudfunctions2_function_iam_member" "invoker" {
#   count          = var.function_invoker_principal != null ? 1 : 0
#   project        = google_cloudfunctions2_function.function.project
#   location       = google_cloudfunctions2_function.function.location
#   cloud_function = google_cloudfunctions2_function.function.name
#   role           = "roles/cloudfunctions.invoker"
#   member         = var.function_invoker_principal
# }
