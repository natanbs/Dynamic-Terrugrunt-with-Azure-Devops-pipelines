variable "resource_group" {
  type        = string
  description = "The name of the resource group"
}

variable "project" {
  type        = string
  description = "The project of the deployment"
}

variable "env" {
  type        = string
  description = "The project of the deployment"
}

variable "instance" {
  type        = string
  description = "The instance of the deployment"
}

variable "region" {
  type        = string
  description = "The region for the deployment"
}

variable "region_name" {
  type        = string
  description = "The short region name"
}

# variable "tags" {
#   type        = map(string)
#   description = "Tags used for the deployment"
#   default = {
#     environment = "dev"
#   }
# }

variable "vnet_name" {
  type        = string
  description = "The name of the vnet"
  default     = "<vnet name>"
}

variable "vnet_address_space" {
  type        = list(any)
  description = "the address space of the VNet"
  default     = ["10.13.0.0/16"]
}

variable "subnets" {
  type = map(any)
  default = {
    bastion_subnet = {
      name             = "AzureBastionSubnet"
      address_prefixes = ["10.13.250.0/24"]
    }
  }
}

 variable "bastionhost_name" {
   type        = string
   description = "The name of the basion host"
 }
