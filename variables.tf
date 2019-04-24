variable "rgid" {
  description = "RGID used for naming"
}

variable "location" {
  default     = "southcentralus"
  description = "Location for resources to be created"
}

variable "count" {
  default = "1"
}

variable "name_prefix" {
  default     = ""
  description = "Allows users to override the standard naming prefix.  If left as an empty string, the standard naming conventions will apply."
}

variable "environment" {
  default     = "dev"
  description = "Environment used in naming lookups"
}

variable "rg_name" {
  description = "Resource group name"
}

variable "kind" {
  default     = "Windows"
  description = "Valid options are Linux or Windows.  Default is Windows."
}

variable "size" {
  default     = "S1"
  description = "Size for app service plan.  Dependent on the specified tier.  For more information see https://azure.microsoft.com/en-us/pricing/details/app-service/windows/.  Default is S1."
}

variable "tier" {
  default     = "Standard"
  description = "Tier for app service plan.  Valid values are: Free, Shared, Basic, Standard, Premium, or PremiumV2.  Default is Standard."
}

# Compute default name values
locals {
  env_id = "${lookup(module.naming.env-map, var.environment, "env")}"
  type   = "${lookup(module.naming.type-map, "azurerm_app_service_plan", "typ")}"

  default_rgid        = "${var.rgid != "" ? var.rgid : "norgid"}"
  default_name_prefix = "c${local.default_rgid}${local.env_id}"

  name_prefix = "${var.name_prefix != "" ? var.name_prefix : local.default_name_prefix}"
  name        = "${local.name_prefix}${local.type}"

  # If kind is linux, this variable must calculate to true
  reserved = "${var.kind != "Windows" ? true : false}"
}

# This module provides a data map output to lookup naming standard references
module "naming" {
  source = "git::https://github.com/CLEAResult/cr-azurerm-naming.git?ref=v1.0.1"
}
