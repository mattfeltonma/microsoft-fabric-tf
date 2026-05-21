locals {

    ## Get the name of the private connection that was created in the template
    ## to be used for auto-approval
    private_endpoint_connection_name = element([
        for connection in data.azapi_resource.fabric_private_link_service.properties.privateEndpointConnections 
        : connection.name
        if endswitch (connection.properties.privateEndpoint.id, fabric_workspace_managed_private_endpoint.fabric_workspace_mpe.name)
    ], 0)
}