# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

identity_token "gcp" {
  audience = ["hcp.workload.identity"]
}

deployment "development" {
  inputs = {
    identity_token = identity_token.gcp.jwt

    audience              = "terraform"
    service_account_email = "terraform@hc-8c36bfff11d141c188238edc45e.iam.gserviceaccount.com"
    project_id            = "hc-8c36bfff11d141c188238edc45e"

    regions = ["us-central1"]
  }
  destroy = true
}

deployment "production" {
  inputs = {
    identity_token = identity_token.gcp.jwt

    audience              = "terraform"
    service_account_email = "terraform@hc-8c36bfff11d141c188238edc45e.iam.gserviceaccount.com"
    project_id            = "hc-8c36bfff11d141c188238edc45e"

    regions = ["us-central1", "us-west1"]
  }
  destroy = true
}
