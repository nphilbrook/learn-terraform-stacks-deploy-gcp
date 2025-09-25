# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

required_providers {
  # google = {
  #   source  = "hashicorp/google"
  #   version = "=7.3.0"
  # }
  # archive = {
  #   source  = "hashicorp/archive"
  #   version = "~> 2.7"
  # }
  # local = {
  #   source  = "hashicorp/local"
  #   version = "~> 2.5"
  # }
  random = {
    source  = "hashicorp/random"
    version = "~>3.7"
  }
  environment = {
    source  = "EppO/environment"
    version = "~>1.3"
  }
}

# provider "google" "configurations" {
#   for_each = var.regions

#   config {
#     project = var.project_id
#     region  = each.value

#     external_credentials {
#       audience              = var.audience
#       service_account_email = var.service_account_email
#       identity_token        = var.identity_token
#     }
#   }
# }

# provider "archive" "this" {}
# provider "local" "this" {}
provider "random" "this" {}
provider "environment" "this" {}
