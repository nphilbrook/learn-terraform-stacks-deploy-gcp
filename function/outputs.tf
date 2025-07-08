# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

output "function_name" {
  description = "Name of the Google Cloud Function."
  value       = google_cloudfunctions2_function.function.name
}

output "invoke_url" {
  description = "The base URL to invoke the Google Cloud Function."
  value       = google_cloudfunctions2_function.function.service_config[0].uri
}
