output "application_password" {
  value       = local.application_password
  description = "The Lacework AD Application password"
  sensitive   = true
}

output "application_id" {
  value       = local.application_id
  description = "The Lacework AD Application id"
}

output "log_profile_name" {
  value       = local.log_profile_name
  description = "[DEPRECATED] The name of the Log Profile for Activity Logs"
}

output "diagnostic_settings_name" {
  value       = var.diagnostic_settings_name
  description = "[DEPRECATED] The name of the subscription's Diagnostic Setting for Activity Logs"
}

output "service_principal_id" {
  value       = module.az_al_ad_application.service_principal_id
  description = "The Lacework Service Principal id"
}

output "storage_account_name" {
  value       = local.storage_account_name
  description = "The name of the Storage Account for Activity Logs"
}

output "storage_account_resource_group" {
  value       = local.storage_account_resource_group
  description = "The resource group of the Storage Account for Activity Logs"
}

output "tenant_id" {
  value       = module.az_al_ad_application.tenant_id
  description = "A Tenant ID used to configure the AD Application"
}
