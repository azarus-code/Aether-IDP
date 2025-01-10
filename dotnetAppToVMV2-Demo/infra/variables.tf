variable "tfe_token" {
  description = "The Terraform Cloud API token"
  type        = string
}

variable "email" {
  description = "The email associated with the Terraform Cloud organization"
  type        = string
  // default     = "bhandarekedar@gmail.com"
}

variable "projectName" {
  description = "The name of the Terraform Cloud project"
  type        = string
  // default     = "IDP"
}

variable "resourceGroupName" {
  description = "The name of the Azure Resource Group"
  type        = string
  // default     = "rg-idp-aks"
}

variable "region" {
  description = "The location/region where the resources will be created"
  type        = string
  // default     = "East US"
}

variable "clusterName" {
  description = "The name of the AKS cluster"
  type        = string
  // default     = "ask-cluster-idp"
}

variable "dns_prefix" {
  description = "The DNS prefix for the AKS cluster"
  type        = string
  default     = "idpaks"
}

variable "node_count" {
  description = "The number of nodes in the default node pool"
  type        = number
  default     = 1
}

variable "vm_size" {
  description = "The size of the Virtual Machine instances"
  type        = string
  default     = "Standard_DS2_v2"
}

variable "acr_name" {
  description = "The name of the Azure Container Registry"
  type        = string
  default     = "idpacrbackstageterraform"
}

variable "subscription_id" {
  description = "The name of the subscription_id"
  type        = string
}