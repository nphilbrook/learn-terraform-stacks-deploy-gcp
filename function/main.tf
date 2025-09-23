# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

resource "random_pet" "function_name" {
  prefix = "stacks"
  length = 2
}

data "archive_file" "function_zip" {
  type        = "zip"
  source_dir  = "${path.module}/hello-world"
  output_path = "/tmp/hello-world.zip"
}

# Because the apply environment may be different from the plan environment, pass
# the file contents through the `data.local_file.function_zip` data source,
# whose value is stored in the plan.
data "local_file" "function_zip" {
  filename = data.archive_file.function_zip.output_path
}

resource "local_file" "function_zip" {
  filename       = "/tmp/final.zip"
  content_base64 = data.local_file.function_zip.content_base64
}

resource "google_storage_bucket_object" "function_zip" {
  name   = "hello-world.zip"
  bucket = var.storage_bucket_name
  source = local_file.function_zip.filename
  # detect_md5hash = local_file.function_zip.content_md5
}

resource "google_cloudfunctions2_function" "function" {
  name        = random_pet.function_name.id
  location    = var.region
  description = "Hello World Function"

  build_config {
    runtime     = "nodejs22"
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

# Allow unauthenticated invocation of the function
resource "google_cloudfunctions2_function_iam_member" "invoker" {
  project        = google_cloudfunctions2_function.function.project
  location       = google_cloudfunctions2_function.function.location
  cloud_function = google_cloudfunctions2_function.function.name
  role           = "roles/cloudfunctions.invoker"
  member         = "allUsers"
}
