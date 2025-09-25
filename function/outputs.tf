# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# output "function_name" {
#   description = "Name of the Google Cloud Function."
#   value       = google_cloudfunctions2_function.function.name
# }

# output "invoke_url" {
#   description = "The base URL to invoke the Google Cloud Function (Cloud Run service URL)."
#   value       = google_cloudfunctions2_function.function.service_config[0].uri
# }

# output "function_url" {
#   description = "The HTTP trigger URL for the Google Cloud Function."
#   value       = "https://${google_cloudfunctions2_function.function.location}-${google_cloudfunctions2_function.function.project}.cloudfunctions.net/${google_cloudfunctions2_function.function.name}"
# }
