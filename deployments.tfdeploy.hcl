# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

identity_token "gcp" {
  audience = ["hcp.workload.identity"]
}

deployment "development" {
  inputs = {
    identity_token = identity_token.gcp.jwt

    audience              = "//iam.googleapis.com/projects/587732306873/locations/global/workloadIdentityPools/fleet-grouper/providers/stacks"
    service_account_email = "fleet-grouper@hc-4fe02dad317344a0829af806f00.iam.gserviceaccount.com"
    project_id            = "hc-4fe02dad317344a0829af806f00"

    regions = ["us-central1"]
  }
}

deployment "production" {
  inputs = {
    identity_token = identity_token.gcp.jwt

    audience              = "//iam.googleapis.com/projects/587732306873/locations/global/workloadIdentityPools/fleet-grouper/providers/stacks"
    service_account_email = "fleet-grouper@hc-4fe02dad317344a0829af806f00.iam.gserviceaccount.com"
    project_id            = "hc-4fe02dad317344a0829af806f00"

    regions = ["us-central1", "us-west1"]
  }
}
