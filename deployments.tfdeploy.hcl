# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

identity_token "gcp" {
  audience = ["hcp.workload.identity"]
}

deployment "development" {
  inputs = {
    identity_token = identity_token.gcp.jwt

    audience              = "//iam.googleapis.com/projects/273379066538/locations/global/workloadIdentityPools/humorous-malamu/providers/stacks"
    service_account_email = "humorous-malamu@hc-d7632f1e0d86431591226359a2e.iam.gserviceaccount.com"
    project_id            = "hc-d7632f1e0d86431591226359a2e"

    regions = ["us-central1"]
  }
}

deployment "production" {
  inputs = {
    identity_token = identity_token.gcp.jwt

    audience              = "//iam.googleapis.com/projects/273379066538/locations/global/workloadIdentityPools/humorous-malamu/providers/stacks"
    service_account_email = "humorous-malamu@hc-d7632f1e0d86431591226359a2e.iam.gserviceaccount.com"
    project_id            = "hc-d7632f1e0d86431591226359a2e"

    regions = ["us-central1", "us-west1"]
  }
}
