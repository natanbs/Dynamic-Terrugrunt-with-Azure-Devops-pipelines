terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
    }
  }
}

variable "resource_enabled" {
  type        = bool
  default     = false # true # 
  description = "Enable or disable creation of Bastion"
}

resource "azurerm_subnet" "subnet" {  
  for_each = var.subnets
  resource_group_name  = "${var.env}-${var.region_name}-${var.instance}-rg"
  virtual_network_name = "${var.env}-${var.region_name}-${var.instance}-vnet"
  name                 = each.value["name"]
  address_prefixes     = each.value["address_prefixes"] 
}

resource "azurerm_public_ip" "bastion_pubip" {
  name                = "${var.env}-${var.region_name}-${var.instance}-bastion-pubIP"
  location              = var.region
  resource_group_name = "${var.env}-${var.region_name}-${var.instance}-rg"
  allocation_method   = "Static"
  sku                 = "Standard"
  tags = {
    environment = var.env
  }
}

resource "azurerm_bastion_host" "bastion" {
  name                = "${var.env}-${var.region_name}-${var.instance}-bastion"
  location            = var.region
  resource_group_name = "${var.env}-${var.region_name}-${var.instance}-rg"
  tags = {
    environment = var.env
  }

  ip_configuration {
    name                 = "bastion_config"
    subnet_id            = azurerm_subnet.subnet["bastion_subnet"].id
    public_ip_address_id = azurerm_public_ip.bastion_pubip.id
  }
}
