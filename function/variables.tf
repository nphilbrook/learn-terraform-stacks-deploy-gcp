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

variable "function_invoker_principal" {
  description = "GCP IAM principal (user, service account, or group) that can invoke the function. Format: user:email@domain.com, serviceAccount:sa@project.iam.gserviceaccount.com, or group:group@domain.com"
  type        = string
  default     = null
}
