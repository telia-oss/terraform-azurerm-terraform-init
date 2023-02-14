
variable "name_prefix" {
  type    = string
  default = "dev"
}

variable "location" {
  type    = string
  default = "swedencentral"
}

variable "container_name" {
  type    = string
  default = "terraform-state"
}

variable "user_defined_tags" {
  type = map(string)
  default = {
    "Environment" = "Development"
  }
}

variable "resource_group_name" {
  type    = string
  default = "rg-terraform-state-dev-swedencentral"
}
