# Complete Example

This example demonstrates how to use the Terraform module for creating the necessary state resources for managing Terraform state, including a Resource Group, Storage Account, and Container. This complete example also re-uses the resource groups and storage account in a second invocation of the module to create a second container.

## Requirements

* Terraform 0.14 or later
* An Azure subscription with permissions to create resources
* Azure CLI

## Usage

To use this example, follow these steps:

* Clone this repository to your local machine
* Change into the examples/complete directory
* Login to your Azure subscription using the Azure CLI:

```shell
az login
```

* Set the Azure CLI context to your desired subscription:

```shell
az account set --subscription <subscription-name-or-id>
```

* Run terraform init to initialize Terraform and download the necessary plugins
* Run terraform plan to see the planned changes
* Run terraform apply to apply the changes and create the resources

## Cleanup

To clean up the resources created by this example, run terraform destroy.


## Contributing

If you'd like to contribute to this module, please follow the guidelines in the [contributing file](../../CONTRIBUTING.md).
