# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

provider "google" {
  project = var.project_id
  region  = var.region
}

resource "random_pet" "bucket_name" {
  prefix = "stacks"
  length = 2
}

resource "google_storage_bucket" "function_bucket" {
  name                        = random_pet.bucket_name.id
  location                    = var.region
  force_destroy               = true
  uniform_bucket_level_access = true
}
