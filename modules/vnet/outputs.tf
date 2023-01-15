output "azure_subnet_id" {
    value = {
        for id in keys(var.subnets) : id => azurerm_subnet.subnet[id].id
    }
    description = "Lists the ID's of the subnets"
}

output "virtual_network_name" {
  description = "The Name of the vnet"
  value       = azurerm_virtual_network.vnet.name
}

# output "bastion_pubip" {
#   value = azurerm_public_ip.bastion_pubip.ip_address
#   description = "List the public IP of the bastion server"
# }