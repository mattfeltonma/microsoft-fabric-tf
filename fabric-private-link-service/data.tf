## Create a data resource that contains all the connections to the Fabric Private Link Service
##
data "azapi_resource" "fabric_private_link_service" {
  depends_on = [ 
    fabric_workspace_managed_private_endpoint.fabric_workspace_mpe 
]

  type = "Microsoft.Fabric/privateLinkServicesForFabric@2024-06-01"
  resource_id = azapi_resource.fabric_private_link_service.id
  response_export_values = ["properties.privateEndpointConnections"]
}
