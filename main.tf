
## Local Variables

locals {
  tags = merge(var.default_tags, var.user_defined_tags)

  short_location = lookup(local.short_location_names, var.location, substr(var.location, 0, 3))

  resource_group_name  = length(var.resource_group_name) > 0 ? var.resource_group_name : "rg-${var.name_prefix}-${local.short_location}-${random_string.resource_group[0].result}"
  storage_account_name = length(var.storage_account_name) > 0 ? var.storage_account_name : "sa${var.name_prefix}${local.short_location}${random_string.azurerm_storage_account[0].result}"
  container_name       = length(var.container_name) > 0 ? var.container_name : "sc-${var.name_prefix}-${local.short_location}"
}

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

/*
resource "random_string" "azurerm_storage_container" {
  length  = 4
  special = false

  keepers = {
    "name" = azurerm_storage_container.this.name
  }
}
*/

## Detect Existing Resources

data "azurerm_resource_group" "this" {
  count = var.azurerm_create_resource_group == false ? 1 : 0
  name  = var.resource_group_name
}

data "azurerm_storage_account" "this" {
  count               = var.azurerm_create_storage_account == false ? 1 : 0
  name                = var.storage_account_name
  resource_group_name = var.azurerm_create_resource_group == false ? data.azurerm_resource_group.this[0].name : azurerm_resource_group.this[0].name
}


## Create needed resources for state storage

resource "azurerm_resource_group" "this" {
  count    = var.azurerm_create_resource_group == false ? 0 : 1
  name     = local.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "this" {
  count                    = var.azurerm_create_storage_account == false ? 0 : 1
  name                     = local.storage_account_name
  resource_group_name      = var.azurerm_create_resource_group == false ? data.azurerm_resource_group.this[0].name : azurerm_resource_group.this[0].name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  tags = local.tags
}

resource "azurerm_storage_container" "this" {
  name                 = local.container_name
  storage_account_name = var.azurerm_create_storage_account == false ? data.azurerm_storage_account.this[0].name : azurerm_storage_account.this[0].name
}
