
## Local Variables

locals {
  tags                 = merge(var.default_tags, var.user_defined_tags, { "Environment" = var.environment })
  short_location       = lookup(local.short_location_names, var.location, substr(var.location, 0, 3))
  resource_group_name  = length(var.resource_group_name) > 0 ? var.resource_group_name : "rg-${var.name_prefix}-${var.environment}-${local.short_location}-${random_string.resource_group[0].result}"
  storage_account_name = length(var.storage_account_name) > 0 ? var.storage_account_name : "sa${var.name_prefix}${local.short_location}${random_string.azurerm_storage_account[0].result}"
  container_name       = length(var.container_name) > 0 ? var.container_name : "sc-${var.name_prefix}-${local.short_location}"

  resolved_storage_account_name = var.azurerm_create_storage_account == false ? data.azurerm_storage_account.this[0].name : azurerm_storage_account.this[0].name
  resolved_resource_group_name  = var.azurerm_create_resource_group == false ? data.azurerm_resource_group.this[0].name : azurerm_resource_group.this[0].name
}

## Random Strings used for naming resources when not provided
resource "random_string" "resource_group" {
  length  = 4
  special = false
  upper   = false
  count   = var.azurerm_create_resource_group == false ? 0 : 1

  keepers = {
    "name"     = var.name_prefix
    "location" = var.location
  }
}

resource "random_string" "azurerm_storage_account" {
  length  = 4
  special = false
  upper   = false
  count   = var.azurerm_create_storage_account == false ? 0 : 1
  keepers = {
    "name"     = var.name_prefix
    "location" = var.location
  }
}

## Detect existing resources for state storage

data "azurerm_resource_group" "this" {
  count = var.azurerm_create_resource_group == false ? 1 : 0
  name  = var.resource_group_name
}

data "azurerm_storage_account" "this" {
  count               = var.azurerm_create_storage_account == false ? 1 : 0
  name                = var.storage_account_name
  resource_group_name = var.azurerm_create_resource_group == false ? data.azurerm_resource_group.this[0].name : azurerm_resource_group.this[0].name

}


## Used when creating new resources for state storage
resource "azurerm_resource_group" "this" {
  count    = var.azurerm_create_resource_group == false ? 0 : 1
  name     = local.resource_group_name
  location = var.location

  tags = merge(local.tags,
    {
      "Name" = local.resource_group_name
    }
  )
}

resource "azurerm_storage_account" "this" {
  count                    = var.azurerm_create_storage_account == false ? 0 : 1
  name                     = local.storage_account_name
  resource_group_name      = var.azurerm_create_resource_group == false ? data.azurerm_resource_group.this[0].name : azurerm_resource_group.this[0].name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  blob_properties {
    versioning_enabled = var.enable_versioning

    dynamic "container_delete_retention_policy" {
      for_each = var.retention_days != null ? [1] : []
      content {
        days = var.retention_days
      }
    }
  }

  tags = merge(local.tags,
    {
      "Name" = local.storage_account_name
    }
  )
}

## The storage container which will hold the state file
resource "azurerm_storage_container" "this" {
  name                  = local.container_name
  container_access_type = var.container_access_type
  storage_account_name  = var.azurerm_create_storage_account == false ? data.azurerm_storage_account.this[0].name : azurerm_storage_account.this[0].name

  metadata = merge({
    for key, value in local.tags :
    lower(key) => value
    },
    {
      "name" = local.container_name
    }
  )
}
