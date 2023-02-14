package module_test

import (
	"testing"

	"github.com/telia-oss/terraform-zure-terraform-init"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
	"module"
)

func TestTerraformModule(t *testing.T) {

tests := []struct {
		description     string
		directory       string
		name            string
		expected        module.Expectations
		generatesConfig bool
	}{
		description: "basic example",
		directory:   "../examples/basic",
		name:        fmt.Sprintf("module-basic-test-%s", random.UniqueId()),
		expected:    module.Expectations{},


	}


	terraformOptions := &terraform.Options{
		// The path to where your Terraform code is located
		TerraformDir: "../examples/basic",

		// Variables to pass to our Terraform code using -var options
		Vars: map[string]interface{}{
			"random_string": "test",
		},

		// Disable color output for passing test result to CI
		NoColor: true,
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	for _, tc := range tests {
		tc := tc // Source: https://gist.github.com/posener/92a55c4cd441fc5e5e85f27bca008721
		t.Run(tc.description, func(t *testing.T) {
			t.Parallel()

			options := &terraform.Options{
				TerraformDir: tc.directory,
				Vars: map[string]interface{}{
					// Bucket name needs to be lowercase.
					"name_prefix": strings.ToLower(tc.name),
					"region":      tc.region,
				},
				EnvVars: map[string]string{
					"AWS_DEFAULT_REGION": tc.region,
				},
			}

			defer terraform.Destroy(t, options)

			// Terraform does not include the local file in the dependency graph.
			// Hence we need to apply with a target to generate the config first.
			if tc.generatesConfig {
				options.Targets = []string{"local_file.config"}
				terraform.InitAndApply(t, options)
				options.Targets = nil
			}

			terraform.InitAndApply(t, options)

			// Run `terraform output` to get the value of an output variable
			rgName := terraform.Output(t, terraformOptions, "resource_group_name")
			saName := terraform.Output(t, terraformOptions, "storage_account_name")
			containerName := terraform.Output(t, terraformOptions, "container_name")

			module.RunTestSuite(t,
				 options,
				 rgName,
				 saName,
				 containerName
				 tc.expected)
		})
	}
}
