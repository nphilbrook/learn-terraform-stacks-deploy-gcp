# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

output "storage_bucket_name" {
  description = "The name of the storage bucket."
  value       = google_storage_bucket.function_bucket.name
}
