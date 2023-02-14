
## Variables


variable "name_prefix" {
  description = "The value is a prefix for the name of the resources created."
  type        = string
  default     = ""
}

variable "resource_group_name" {
  type    = string
  default = ""
}

variable "location" {
  type    = string
  default = "westus2"
}

variable "storage_account_name" {
  type    = string
  default = ""
}

variable "account_tier" {
  type    = string
  default = "Standard"
}

variable "account_replication_type" {
  type    = string
  default = "LRS"
}

variable "container_name" {
  type        = string
  description = "The name of the storage container which will hold the state file."
  default     = "terraform-state"
}

variable "container_access_type" {

  description = "The access level for the storage container. Possible values are private, blob, container."
  type        = string
  default     = "private"
}

variable "user_defined_tags" {
  description = "The value is a map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "default_tags" {
  description = "The value is a map of default tags to assign to the resource."
  type        = map(string)
  default = {
    "CreatedBy" = "Terraform"
  }
}



variable "azurerm_create_resource_group" {
  description = "The value is a boolean to indicate if the resource group should be created."
  type        = bool
  default     = false
}

variable "azurerm_create_storage_account" {

  description = "The value is a boolean to indicate if the storage account should be created."
  type        = bool
  default     = false
  /* validation {
    condition     = var.azurerm_create_resource_group == true
    error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
  }*/
}
