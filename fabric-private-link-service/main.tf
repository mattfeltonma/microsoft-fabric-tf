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
        tenantId = var.tenant_id
        workspaceId = var.fabric_workspace_id
    }
  }
}