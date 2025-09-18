# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

resource "random_pet" "function_name" {
  prefix = "stacks"
  length = 2
}

data "local_file" "function_zip" {
  filename = data.archive_file.function_zip.output_path
}

data "archive_file" "function_zip" {
  type        = "zip"
  source_dir  = "${path.module}/hello-world"
  output_path = "/tmp/hello-world.zip"
}

resource "google_storage_bucket_object" "function_zip" {
  name    = "hello-world.zip"
  bucket  = var.storage_bucket_name
  content = data.local_file.function_zip.content_base64
}

resource "google_cloudfunctions2_function" "function" {
  name        = random_pet.function_name.id
  location    = var.region
  description = "Hello World Function"

  build_config {
    runtime     = "nodejs18"
    entry_point = "helloWorld"

    source {
      storage_source {
        bucket = var.storage_bucket_name
        object = google_storage_bucket_object.function_zip.name
      }
    }
  }

  service_config {
    available_memory   = "256M"
    timeout_seconds    = 60
    ingress_settings   = "ALLOW_ALL"
    max_instance_count = 1
  }
}
