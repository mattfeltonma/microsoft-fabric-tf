## Create Fabric Private Link Service resource
##
resource "azapi_resource" "fabric_private_link_service" {

  type                      = "Microsoft.Fabric/privateLinkServicesForFabric@2024-06-01"
  name                      = var.fabric_pls_name
  parent_id                 = var.resource_group_id
  location                  = "global"
  schema_validation_enabled = false

  body = {
    properties = {
      tenantId    = var.tenant_id
      workspaceId = var.fabric_workspace_id
    }
  }
}

## Create the Fabric Workspace managed private endpoint
##
resource "fabric_managed_private_endpoint" "fabric_workspace_mpe" {
  name                            = var.managed_pe_name
  workspace_id                    = var.fabric_workspace_id
  target_private_link_resource_id = azapi_resource.fabric_private_link_service.id
  target_subresource_type         = "workspace"
  request_message                 = "Automated approval for workspace ${var.fabric_workspace_id}"
}

## Approve the managed private endpoint
##
resource "azapi_update_resource" "approve_mpe" {
  type = "Microsoft.Fabric/privateLinkServicesForFabric/privateEndpointConnections@2024-06-01"
  name = local.private_endpoint_connection_name
  parent_id = azapi_resource.fabric_private_link_service.id

  body = {
    properties = {
        privateLinkServieConnectionState = {
            description = "Auto Approved by Terraform"
            status = "Approved"
        }
    }
  }
}