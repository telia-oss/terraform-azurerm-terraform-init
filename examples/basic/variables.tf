
variable "name_prefix" {
  type    = string
  default = "example"
}

variable "location" {
  type    = string
  default = "swedencentral"
}

variable "environment" {
  type    = string
  default = "dev"
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
