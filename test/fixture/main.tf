provider "random" {
  version = "~> 2.1"
}

resource "random_id" "name" {
  byte_length = 8
}

resource "azurerm_resource_group" "rg" {
  name     = format("%s-%s", var.rg_name, random_id.name.hex)
  location = var.location
}

module "plan" {
  source   = "../../"
  rgid     = var.rgid
  rg_name  = basename(azurerm_resource_group.rg.id)
  location = var.location
}

