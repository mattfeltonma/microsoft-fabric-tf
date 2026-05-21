## Create a data resource that contains all the connections to the Fabric Private Link Service
##
data "azapi_resource" "fabric_private_link_service" {
  type = "Microsoft.Fabric/privateLinkServicesForFabric@2024-06-01"
  resource_id = azapi_resource.fabric_private_link_service.id
  response_export_values = ["properties.privateEndpointConnections"]
}
