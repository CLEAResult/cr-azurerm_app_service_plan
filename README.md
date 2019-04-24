# cr-azurerm_app_service_plan

Creates an Azure app service plan.

# Required Input Variables

* `rgid` - Resource group ID - used in naming rules
* `rg_name` - Resource group name where the plan will be created

Note that the resource group in `rg_name` must exist prior to creating the plan.  See https://github.com/CLEAResult/cr-terraform-examples for a working example.

# Example

```
variable "rgid" {
  default = "99999"
}

variable "rg_name" {
  default = "resourcegroupname"
}

module "plan" {
  source = "git::ssh://git@github.com/clearesult/cr-azurerm_app_service_plan.git"
  rg_name = "${var.rg_name}"
  rgid = "${var.rgid}"
}
```
