terraform {
  backend "remote" {
    organization = "kedar-org"
   
    # The name of the Terraform Cloud workspace to store Terraform state files in.
    workspaces {
      name = "NodeJSAks"
    }
  }
}

provider "tfe" {
  hostname = "app.terraform.io"
  token    = var.tfe_token
}

resource "tfe_project" "project" {
  organization = "kedar-org"
  name         = var.projectName
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "aks_rg" {
  name     = var.resourceGroupName
  location = var.region
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.clusterName
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = var.vm_size
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "random_string" "racr" {
  length           = 5
  lower            = true
}

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.aks_rg.name
  location            = azurerm_resource_group.aks_rg.location
  sku                 = "Basic"
}
