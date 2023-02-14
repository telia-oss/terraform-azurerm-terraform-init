# Azure Terraform State Management Module

 This module is intended to be used as a Terraform module for managing Terraform state. This Terraform module creates the necessary state resources for managing Terraform state in Azure, including a Resource Group, Storage Account and Container. This module can be used to create the state resources for a single Terraform configuration, or it can be used to create the state resources for a Terraform configuration that manages multiple Terraform configurations.

## Usage

To use this module, simply add the following to your Terraform configuration:

```hcl
module "state_resources" {
    source = "telia-oss/terraform-azure-terraform-init"
    resource_group_name = var.resource_group_name
    location = var.location
    environment = var.environment
    storage_account_name = var.storage_account_name
    container_name = var.container_name
    create_resource_group = true
    create_storage_account = true
}
```

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_storage_account.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_container.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |
| [random_string.azurerm_storage_account](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [random_string.resource_group](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_storage_account.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_account) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_replication_type"></a> [account\_replication\_type](#input\_account\_replication\_type) | n/a | `string` | `"LRS"` | no |
| <a name="input_account_tier"></a> [account\_tier](#input\_account\_tier) | n/a | `string` | `"Standard"` | no |
| <a name="input_azurerm_create_resource_group"></a> [azurerm\_create\_resource\_group](#input\_azurerm\_create\_resource\_group) | The value is a boolean to indicate if the resource group should be created. | `bool` | `false` | no |
| <a name="input_azurerm_create_storage_account"></a> [azurerm\_create\_storage\_account](#input\_azurerm\_create\_storage\_account) | The value is a boolean to indicate if the storage account should be created. | `bool` | `false` | no |
| <a name="input_container_access_type"></a> [container\_access\_type](#input\_container\_access\_type) | The access level for the storage container. Possible values are private, blob, container. | `string` | `"private"` | no |
| <a name="input_container_name"></a> [container\_name](#input\_container\_name) | The name of the storage container which will hold the state file. | `string` | `"terraform-state"` | no |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | The value is a map of default tags to assign to the resource. | `map(string)` | <pre>{<br>  "CreatedBy": "Terraform"<br>}</pre> | no |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | `"westus2"` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | The value is a prefix for the name of the resources created. | `string` | `""` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | `""` | no |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | n/a | `string` | `""` | no |
| <a name="input_user_defined_tags"></a> [user\_defined\_tags](#input\_user\_defined\_tags) | The value is a map of tags to assign to the resource. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_backend_config"></a> [backend\_config](#output\_backend\_config) | The backend configuration for the Terraform state. |
| <a name="output_container_name"></a> [container\_name](#output\_container\_name) | The name of the container in which the Terraform state is stored. |
| <a name="output_container_url"></a> [container\_url](#output\_container\_url) | The URL of the container in which the Terraform state is stored. |
| <a name="output_name_prefix"></a> [name\_prefix](#output\_name\_prefix) | The name prefix used for all resources created by this module. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | The name of the resource group in which the Terraform state is stored. |
| <a name="output_storage_account_name"></a> [storage\_account\_name](#output\_storage\_account\_name) | The name of the storage account in which the Terraform state is stored. |

## Contributing

If you'd like to contribute to this module, please follow the guidelines in the [contributing file](CONTRIBUTING.md).
