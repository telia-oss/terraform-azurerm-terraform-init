output "backend_config" {
  value = jsonencode({
    "storage_account_name" = azurerm_storage_account.this[0].name
    "container_name"       = azurerm_storage_container.this.name
    "access_key"           = azurerm_storage_account.this[0].primary_access_key
    "key"                  = "${var.name_prefix}-terraform.tfstate"
  })
}

output "resource_group_name" {
  value = azurerm_resource_group.this[0].name
}

output "storage_account_name" {
  value = azurerm_storage_account.this[0].name
}

output "container_name" {
  value = azurerm_storage_container.this.name
}

output "name_prefix" {
  value = var.name_prefix
}
