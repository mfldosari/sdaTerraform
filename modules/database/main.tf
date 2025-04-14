resource "azurerm_postgresql_flexible_server" "this" {
  name                   = "chatbot-database-sda-weclouddata"
  resource_group_name    = var.rg_name
  location               = var.location
  version                = "13"  
  administrator_login    = var.db_username
  administrator_password = var.db_password
  storage_mb             = 5120  
  sku_name               = "Standard_B1ms"  


  high_availability {
    mode = "Disabled" 
  }
}

resource "azurerm_postgresql_flexible_server_database" "this" {
  name      = "postgres"
  server_id = azurerm_postgresql_flexible_server.this.id
  collation = "en_US.utf8"
  charset   = "UTF8"

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}