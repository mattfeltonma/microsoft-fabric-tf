# Configure the AzApi and AzureRM providers
terraform {
  required_providers {
    azapi = {
      source  = "azure/azapi"
      version = "~> 2.8.0"
    }

    fabric = {
      source  = "microsoft/fabric"
      version = "~> 1.10.0"
    }
  }
  required_version = ">= 1.8.3"
}