
## Variables

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
  type    = string
  default = "terraform-state"
}

variable "container_access_type" {
  type    = string
  default = "private"
}

variable "user_defined_tags" {
  type    = map(string)
  default = {}
}

variable "default_tags" {
  type = map(string)
  default = {
    "CreatedBy" = "Terraform"
  }
}

variable "name_prefix" {
  type    = string
  default = ""
}

variable "azurerm_create_resource_group" {
  type    = bool
  default = false
}

variable "azurerm_create_storage_account" {
  type    = bool
  default = false
}
