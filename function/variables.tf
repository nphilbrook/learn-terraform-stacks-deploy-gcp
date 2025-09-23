# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "region" {
  description = "GCP region."
  type        = string
}

variable "project_id" {
  description = "GCP project ID."
  type        = string
}

variable "storage_bucket_name" {
  description = "Name of the storage bucket."
  type        = string
}
