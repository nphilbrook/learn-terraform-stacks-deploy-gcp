# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

required_providers {
  google = {
    source  = "hashicorp/google"
    version = "~> 7.3"
  }
  archive = {
    source  = "hashicorp/archive"
    version = "~> 2.7"
  }
  random = {
    source  = "hashicorp/random"
    version = "~> 3.7"
  }
  local = {
    source  = "hashicorp/local"
    version = "~> 2.5"
  }
}

provider "google" "configurations" {
  for_each = var.regions

  config {
    project = var.project_id
    region  = each.value

    external_credentials {
      audience              = var.audience
      service_account_email = var.service_account_email
      identity_token        = var.identity_token
    }
  }
}

provider "random" "this" {}
provider "archive" "this" {}
provider "local" "this" {}
