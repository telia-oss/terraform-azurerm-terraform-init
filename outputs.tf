output "backend_config" {
  description = "The backend configuration for the Terraform state."
  value = {
    azurerm = {
      resource_group_name  = local.resolved_resource_group_name
      storage_account_name = local.resolved_storage_account_name
      container_name       = azurerm_storage_container.this.name
      key                  = "${var.name_prefix}-terraform.tfstate"
  } }
}

output "resource_group_name" {
  description = "The name of the resource group in which the Terraform state is stored."
  value       = local.resolved_resource_group_name
}

output "storage_account_name" {
  description = "The name of the storage account in which the Terraform state is stored."
  value       = local.resolved_storage_account_name
}

output "container_name" {
  description = "The name of the container in which the Terraform state is stored."
  value       = azurerm_storage_container.this.name
}

output "container_id" {
  description = "The id of the container in which the Terraform state is stored."
  value       = azurerm_storage_container.this.id
}

output "name_prefix" {
  description = "The name prefix used for all resources created by this module."
  value       = var.name_prefix
}

output "environment" {
  description = "The environment in which the Terraform state is stored."
  value       = var.environment
}

output "location" {
  description = "The location in which the Terraform state is stored."
  value       = var.location
}
