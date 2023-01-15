output "bastion_pubip" {
  value = azurerm_public_ip.bastion_pubip.ip_address
  description = "List the public IP of the bastion server"
}