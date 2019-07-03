output "id" {
  description = "Azure resource ID of the Azure SQL Database created."
  value       = module.plan.*.id
}

output "name" {
  description = "Server name of the Azure SQL Database created."
  value       = module.plan.*.name
}
