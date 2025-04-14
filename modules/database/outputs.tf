output "postgresql_server_endpoint" {
  value = azurerm_postgresql_flexible_server.this.fqdn
}