variable "all_subscriptions" {
  type        = bool
  default     = false
  description = "If set to `true`, grant read access to ALL subscriptions within the selected Tenant (overrides `subscription_ids`)"
}
variable "application_id" {
  type        = string
  default     = ""
  description = "The Active Directory Application id to use (required when use_existing_ad_application is set to true)"
}
variable "application_name" {
  type        = string
  default     = "lacework_security_audit"
  description = "The name of the Azure Active Directory Application (required when use_existing_ad_application is set to true) "
}
variable "application_password" {
  type        = string
  default     = ""
  description = "The Active Directory Application password to use (required when use_existing_ad_application is set to true) "
}
variable "diagnostic_settings_name" {
  type        = string
  default     = "lacework_activity_logs"
  description = "The name of the subscription's Diagnostic Setting for Activity Logs"
}
variable "lacework_integration_name" {
  type        = string
  default     = "TF activity log"
  description = "The Lacework integration name"
}
variable "location" {
  type        = string
  description = "Azure region where the storage account for logging will reside"
  default     = "West US 2"
}
# NOTE: this prefix is used in all resources and we have a limitation with the
# storage name that can only consist of lowercase letters and numbers, and must
# be between 3 and 24 characters long
variable "prefix" {
  type        = string
  default     = "lacework"
  description = "The prefix to use at the beginning of every generated resource"
}
variable "service_principal_id" {
  type        = string
  default     = ""
  description = "The Enterprise App Object ID related to the application_id (required when use_existing_ad_application is true)"
}
variable "storage_account_name" {
  type        = string
  default     = ""
  description = "The name of the Storage Account"
}
variable "storage_account_resource_group" {
  type        = string
  default     = ""
  description = "The Resource Group for the existing Storage Account"
}
variable "subscription_ids" {
  type        = list(string)
  description = "List of subscriptions to enable logging (by default the module will only use the primary subscription)"
  default     = []
}
variable "tags" {
  type = map(string)
  default = {}
  description = "Key-value map of Tag names and Tag values"
}
variable "use_existing_ad_application" {
  type        = bool
  default     = false
  description = "Set this to `true` to use an existing Active Directory Application"
}
variable "use_existing_storage_account" {
  type        = bool
  default     = false
  description = "Set this to `true` to use an existing Storage Account. Default behavior creates a new Storage Account"
}
variable "wait_time" {
  type        = string
  default     = "50s"
  description = "Amount of time to wait before the Lacework resources are provisioned"
}


