# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

identity_token "gcp" {
  audience = ["//iam.googleapis.com/projects/1037354265927/locations/global/workloadIdentityPools/terraform/providers/hcp-terraform"]
}

deployment "development" {
  inputs = {
    identity_token = identity_token.gcp.jwt

    audience                   = "//iam.googleapis.com/projects/1037354265927/locations/global/workloadIdentityPools/terraform/providers/hcp-terraform"
    service_account_email      = "terraform@hc-8c36bfff11d141c188238edc45e.iam.gserviceaccount.com"
    project_id                 = "hc-8c36bfff11d141c188238edc45e"
    function_invoker_principal = "user:nick.philbrook@hashicorp.com"

    regions = ["us-central1"]
  }
  destroy = true
}

deployment "production" {
  inputs = {
    identity_token = identity_token.gcp.jwt

    audience                   = "//iam.googleapis.com/projects/1037354265927/locations/global/workloadIdentityPools/terraform/providers/hcp-terraform"
    service_account_email      = "terraform@hc-8c36bfff11d141c188238edc45e.iam.gserviceaccount.com"
    project_id                 = "hc-8c36bfff11d141c188238edc45e"
    function_invoker_principal = "user:nick.philbrook@hashicorp.com"

    regions = ["us-central1", "us-west1"]
  }
  destroy = true
}
