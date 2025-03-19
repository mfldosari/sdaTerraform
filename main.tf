terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.23.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "..."
}

resource "azurerm_resource_group" "sda_main" {
  name     = "pf-sdaonsite-rg"
  location = local.resource_location

  tags = merge(local.tags,{
    name = "tagged name"
  })
}

