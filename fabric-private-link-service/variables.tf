variable "fabric_workspace_id" {
  description = "This is the Fabric workspace ID of the target workspace"
  type        = string
}

variable "fabric_pls_name" {
  description = "This is the name of the Fabric Private Link Service resource that will be created"
  type        = string
}

variable "resource_group_id" {
  description = "This is the id of the Azure resource group the Fabric Private Link Service will be deployed to"
  type        = string
}

variable "tenant_id" {
  description = "The Entra ID tenant ID"
  type        = string
}
