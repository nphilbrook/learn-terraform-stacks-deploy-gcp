# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

component "storage" {
  for_each = var.regions

  source = "./storage"

  inputs = {
    region     = each.value
    project_id = var.project_id
  }

  providers = {
    google = provider.google.configurations[each.value]
    random = provider.random.this
  }
}

component "function" {
  for_each = var.regions

  source = "./function"

  inputs = {
    region                     = each.value
    project_id                 = var.project_id
    storage_bucket_name        = component.storage[each.value].storage_bucket_name
    function_invoker_principal = var.function_invoker_principal
  }

  providers = {
    google  = provider.google.configurations[each.value]
    archive = provider.archive.this
    random  = provider.random.this
    local   = provider.local.this
  }
}
