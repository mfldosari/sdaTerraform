variable "vnet_name" {
  description = "The name of the virtual network"
}

variable "address_space" {
  description = "The address space of the virtual network"
  
}

variable "subnet_name" {
  description = "The name of the subnet"
}

variable "subnet_prefixe" {
  description = "The subnet address prefix"
 
}


variable "rg_name" {
  description = "The resource group name"
}

variable "location" {
  description = "The location of the resources"
}

variable "nic_name" {
  description = "The name of the network interface"
}

variable "nsg_name" {
  description = "The name of the network interface"
}

#########################

variable "vm_name" {
  description = "The name of the virtual network"
}

variable "vm_size" {
  description = "Size of VM"
}
variable "admin_username" {
  description = "admin username for vm"
}

#############


variable "db_username" {
  description = "database username:"
}

variable "db_password" {
  description = "database password"
}
