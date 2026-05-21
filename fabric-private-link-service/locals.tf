locals {

    ## Get the name of the private connection that was created in the template
    ## to be used for auto-approval
    fabric_pls_output = azapi_resource.fabric_private_link_service.output
    
    private_endpoint_connection_name = try(
        local.fabric_pls_output.properties.privateEndpointConnections[0].name,
        null
    )
}