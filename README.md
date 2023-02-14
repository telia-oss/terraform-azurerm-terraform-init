# Terraform State Management Module

This Terraform module creates the necessary state resources for managing Terraform state in Azure, including a Resource Group, Storage Account and Container.

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
}
```

## Inputs

The following inputs are required:

- `resource_group_name`: The name of the resource group to create.
- `location`: The location where the resources will be created.
- `environment`: The environment for which the resources will be created.
- `storage_account_name`: The name of the storage account to create.
- `container_name`: The name of the container to create.

## Outputs

The following outputs are available:

- `resource_group_id`: The ID of the created resource group.
- `storage_account_id`: The ID of the created storage account.
- `container_id`: The ID of the created container.

## Contributing

If you'd like to contribute to this module, please follow the guidelines in the [contributing file](CONTRIBUTING.md).
