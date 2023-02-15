
module "state_resources" {
  source                         = "../../"
  name_prefix                    = var.name_prefix
  environment                    = var.environment
  resource_group_name            = "rg-example-dev-sdc-663h"
  location                       = var.location
  container_name                 = var.container_name
  user_defined_tags              = var.user_defined_tags
  azurerm_create_resource_group  = false
  azurerm_create_storage_account = true
}
