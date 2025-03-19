resource "azurerm_virtual_network" "sda_main_vnet" {
  name                = local.virtual_network.name
  location            = local.resource_location
  resource_group_name = azurerm_resource_group.sda_main.name
  address_space       = local.virtual_network.address_prefixes

  tags = local.tags
}

resource "azurerm_subnet" "websub" {
  name                 = local.subnets[0].name
  resource_group_name  = azurerm_resource_group.sda_main.name
  virtual_network_name = azurerm_virtual_network.sda_main_vnet.name
  address_prefixes     = local.subnets[0].address_prefix
}

resource "azurerm_subnet" "appsub" {
  name                 = local.subnets[1].name
  resource_group_name  = azurerm_resource_group.sda_main.name
  virtual_network_name = azurerm_virtual_network.sda_main_vnet.name
  address_prefixes     = local.subnets[1].address_prefix
}

resource "azurerm_network_interface" "webapp_nic" {
  name                = "webapp-nic"
  location            = local.resource_location
  resource_group_name = azurerm_resource_group.sda_main.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.websub.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.webapp_ip.id
  }

  tags = local.tags
}

resource "azurerm_public_ip" "webapp_ip" {
  name                = "public-webapp-ip"
  resource_group_name = azurerm_resource_group.sda_main.name
  location            = local.resource_location
  allocation_method   = "Static"

  tags = local.tags
}

resource "azurerm_network_security_group" "webapp_nsg" {
  name                = "pf-sdawebapp-nsg"
  location            = local.resource_location
  resource_group_name = azurerm_resource_group.sda_main.name

  security_rule {
    name                       = "SSH"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = local.tags
}

resource "azurerm_subnet_network_security_group_association" "websub_assoc" {
  subnet_id                 = azurerm_subnet.websub.id
  network_security_group_id = azurerm_network_security_group.webapp_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "appsub_assoc" {
  subnet_id                 = azurerm_subnet.appsub.id
  network_security_group_id = azurerm_network_security_group.webapp_nsg.id
}
