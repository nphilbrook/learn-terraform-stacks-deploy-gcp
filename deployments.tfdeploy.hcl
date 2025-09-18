# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

identity_token "gcp" {
  audience = ["hcp.workload.identity"]
}

deployment "development" {
  inputs = {
    identity_token = identity_token.gcp.jwt

    audience              = "<YOUR_JWT_AUDIENCE>"
    service_account_email = "<YOUR_SERVICE_ACCOUNT_EMAIL>"
    project_id            = "<YOUR_GCP_PROJECT_ID>"

    regions = ["us-central1"]
  }
}

deployment "production" {
  inputs = {
    identity_token = identity_token.gcp.jwt

    audience              = "<YOUR_JWT_AUDIENCE>"
    service_account_email = "<YOUR_SERVICE_ACCOUNT_EMAIL>"
    project_id            = "<YOUR_GCP_PROJECT_ID>"

    regions = ["us-central1", "us-west1"]
  }
}
