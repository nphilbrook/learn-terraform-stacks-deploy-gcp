# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

identity_token "gcp" {
  audience = ["hcp.workload.identity"]
}

deployment "development" {
  inputs = {
    identity_token = identity_token.gcp.jwt

    audience              = "//iam.googleapis.com/projects/852811775610/locations/global/workloadIdentityPools/needed-oarfish/providers/stacks"
    service_account_email = "needed-oarfish@hc-c374ccece62547959c99d37a894.iam.gserviceaccount.com"
    project_id            = "hc-c374ccece62547959c99d37a894"

    regions = ["us-central1"]
  }
}

deployment "production" {
  inputs = {
    identity_token = identity_token.gcp.jwt

    audience              = "//iam.googleapis.com/projects/852811775610/locations/global/workloadIdentityPools/needed-oarfish/providers/stacks"
    service_account_email = "needed-oarfish@hc-c374ccece62547959c99d37a894.iam.gserviceaccount.com"
    project_id            = "hc-c374ccece62547959c99d37a894"

    regions = ["us-central1", "us-west1"]
  }
}
