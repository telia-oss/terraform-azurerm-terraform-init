

module "state_resources_parent" {
  source                         = "../../"
  name_prefix                    = var.name_prefix
  location                       = var.location
  environment                    = var.environment
  container_name                 = var.container_name
  user_defined_tags              = var.user_defined_tags
  azurerm_create_resource_group  = true
  azurerm_create_storage_account = true

}

module "state_resources_child" {
  source                         = "../../"
  name_prefix                    = var.name_prefix
  environment                    = module.state_resources_parent.environment
  resource_group_name            = module.state_resources_parent.resource_group_name
  storage_account_name           = module.state_resources_parent.storage_account_name
  location                       = module.state_resources_parent.location
  container_name                 = "terraform-state-child"
  user_defined_tags              = var.user_defined_tags
  azurerm_create_resource_group  = false
  azurerm_create_storage_account = false

}

// TODO: Output all the values from the modules
