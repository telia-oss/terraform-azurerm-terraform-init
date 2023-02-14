

module "state_resources" {
  source      = "../../"
  name_prefix = var.name_prefix
  location                       = var.location
  container_name                 = var.container_name
  user_defined_tags              = var.user_defined_tags
  azurerm_create_resource_group  = true
  azurerm_create_storage_account = true

}

module "state_resources2" {
  source                         = "../../"
  name_prefix                    = var.name_prefix
  resource_group_name            = module.state_resources2.resource_group_name
  storage_account_name           = module.state_resources2.storage_account_name
  location                       = var.location
  container_name                 = "terraform-state-2"
  user_defined_tags              = var.user_defined_tags
  azurerm_create_resource_group  = false
  azurerm_create_storage_account = false

}

// TODO: Output all the values from the modules
