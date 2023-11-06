variable "name_prefix" {
  description = "Prefix used to name all resources created by this module, ensuring a consistent naming convention."
  type        = string
  validation {
    condition     = length(var.name_prefix) > 0
    error_message = "The name_prefix value must be a non-empty string."
  }
}

variable "resource_group_name" {
  description = "Name of the Azure Resource Group where resources will be created. If left empty, a new resource group is created."
  type        = string
  default     = ""
}

variable "location" {
  description = "Azure region where all resources in this module will be created."
  type        = string
}

variable "environment" {
  description = "The environment for which this module is being deployed (e.g., prod, dev, staging)."
  type        = string
}

variable "storage_account_name" {
  description = "Name of the Azure Storage Account to be used or created for storing Terraform state."
  type        = string
  default     = ""
}

variable "account_tier" {
  description = "The performance tier of the storage account. Valid options are Standard or Premium."
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "The replication type for the storage account. Valid options are LRS, GRS, RAGRS, and ZRS."
  type        = string
  default     = "LRS"
}

variable "container_name" {
  description = "Name of the storage container within the Azure Storage Account where the Terraform state file will be stored."
  type        = string
  default     = "terraform-state"
}

variable "container_access_type" {
  description = "Defines the access level for the storage container. Valid options are private, blob, or container."
  type        = string
  default     = "private"
}

variable "user_defined_tags" {
  description = "A map of user-defined tags to assign to all resources created by this module."
  type        = map(string)
  default     = {}
}

variable "default_tags" {
  description = "A map of default tags to assign to all resources created by this module. Merged with user_defined_tags, if any."
  type        = map(string)
  default = {
    "ManagedBy" = "Terraform"
  }
}

variable "azurerm_create_resource_group" {
  description = "Boolean flag to control whether a new resource group should be created or use an existing one."
  type        = bool
  default     = false
}

variable "azurerm_create_storage_account" {
  description = "Boolean flag to control whether a new storage account should be created or use an existing one."
  type        = bool
  default     = false
  /* validation {
    condition     = !(var.azurerm_create_resource_group == true && azurerm_create_storage_account == false)
    error_message = "If azurerm_create_resource_group is true, azurerm_create_storage_account must also be true."
  }*/
}

variable "enable_versioning" {
  description = "Boolean flag to control whether blob versioning should be enabled on the storage account."
  type        = bool
  default     = true

}

variable "retention_days" {
  description = "Number of days to retain deleted blobs. Set to null to disable retention policy."
  type        = number
  default     = 30
}
