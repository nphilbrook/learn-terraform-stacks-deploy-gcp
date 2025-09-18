# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "regions" {
  type = set(string)
}

variable "project_id" {
  type = string
}

variable "identity_token" {
  type        = string
  ephemeral   = true
  description = "JWT identity token"
}

variable "audience" {
  type        = string
  description = "JWT token audience"
}

variable "service_account_email" {
  type        = string
  description = "Service account email"
}