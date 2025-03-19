output "public_ip_address_id" {
  value = azurerm_public_ip.webapp_ip
}

output "public_ip" {
  value = azurerm_public_ip.webapp_ip.ip_address
}