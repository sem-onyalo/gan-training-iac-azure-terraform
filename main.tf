terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

variable "storage_account_name" {
  type = string
  default = "5d1796b484c2431eb911"
  description = "The name of the Azure storage account to create."
}

resource "azurerm_resource_group" "gan_training_resource_group" {
  name     = "gan_training_resource_group"
  location = "westus2"
}

resource "azurerm_storage_account" "training_storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.gan_training_resource_group.name
  location                 = azurerm_resource_group.gan_training_resource_group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "training_storage" {
  name                  = "gan-training-storage"
  storage_account_name  = azurerm_storage_account.training_storage_account.name
  container_access_type = "private"
}
