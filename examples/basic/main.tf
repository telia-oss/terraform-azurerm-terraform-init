module "state_resources" {
  source      = "../../"
  name_prefix = var.name_prefix
  # resource_group_name            = var.resource_group_name
  location                       = var.location
  container_name                 = var.container_name
  user_defined_tags              = var.user_defined_tags
  azurerm_create_resource_group  = true
  azurerm_create_storage_account = true

}
