package module

import (
	"testing"

	"github.com/Azure/azure-sdk-for-go/sdk/azcore"
	"github.com/Azure/azure-sdk-for-go/sdk/azidentity"
)

// NewSession for Azure.
func NewSession(t *testing.T) *azcore.TokenCredential {
	cred, err := azidentity.NewDefaultAzureCredential(nil)

	if err != nil {
		t.Fatalf("failed to create new CLI session: %s", err)
	}
	return cred
}

// Expectations for the test suite.
type Expectations struct {
	NamePrefix         string
	ResourceGroupName  string
	StorageAccountName string
	StorageContainerName
}

// RunTestSuite for the module.
func RunTestSuite(t *testing.T, rgName string,
	saName string,
	containerName, string, expected Expectations) {
	if expected. != rgName {
		t.Fatalf("expected: %s, got: %s", expected.NamePrefix, namePrefix)
	}
}
