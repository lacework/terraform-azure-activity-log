output "application_password" {
  value       = local.application_password
  description = "The Lacework AD Application password"
  sensitive   = true
}
output "application_id" {
  value       = local.application_id
  description = "The Lacework AD Application id"
}
output "diagnostic_settings_name" {
  value       = var.diagnostic_settings_name
  description = "The name of the subscription's Diagnostic Setting for Activity Logs"
}
output "service_principal_id" {
  value       = local.service_principal_id
  description = "The Lacework Service Principal id"
}
output "storage_account_name" {
  value       = local.storage_account_name
  description = "The name of the centralized Storage Account for Activity Logs"
}
output "storage_account_resource_group" {
  value       = local.storage_account_resource_group
  description = "The resource group of the centralized Storage Account for Activity Logs"
}
output "subscription_ids" {
  value       = local.subscription_ids
  description = "The list of subscriptions that will send Activity Logs to the storage account"
}
