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
  default     = "activity-logs"
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
variable "log_retention_days" {
  type        = number
  description = "Specifies the number of days that logs will be retained"
  default     = 10
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
variable "subscription_exclusions" {
  type        = list(string)
  description = "List of subscriptions to exclude when using the `all_subscriptions` option."
  default     = []
}
variable "subscription_ids" {
  type        = list(string)
  description = "List of subscriptions to enable logging (by default the module will only use the primary subscription)"
  default     = []
}
variable "tags" {
  type        = map(string)
  default     = {}
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
variable "infrastructure_encryption_enabled" {
  type        = bool
  default     = false
  description = "Enable Infrastructure Encryption for Azure Storage Account"
}
variable "use_storage_account_network_rules" {
  type        = bool
  default     = false
  description = "Configure azurerm_storage_account_network_rules resource"
}
variable "storage_account_network_rule_action" {
  type        = string
  default     = "Deny"
  description = "Configure azurerm_storage_account_network_rules resource"
}
variable "storage_account_network_rule_bypass" {
  type        = list(string)
  default     = ["Metrics", "Logging", "AzureServices"]
  description = "Specifies whether traffic is bypassed for Logging/Metrics/AzureServices. Valid options are any combination of `Logging`, `Metrics`, `AzureServices`, or `None`. Requires `use_storage_account_network_rules` enabled."
}
variable "storage_account_network_rule_subnet_ids" {
  type        = list(string)
  default     = []
  description = "A list of virtual network subnet ids to secure the storage account. Requires `use_storage_account_network_rules` enabled."
}
variable "storage_account_network_rule_ip_rules" {
  type        = list(string)
  default     = []
  description = "List of allowed ip addresses. Requires `use_storage_account_network_rules` enabled."
}
variable "storage_account_network_rule_lacework_ip_rules" {
  type        = list(string)
  default     = [
    # US
    "34.208.85.38", 
    "35.165.121.10",  
    "35.165.62.149",
    "35.165.83.150",  
    "35.166.181.157",
    "35.93.121.192/26",
    "44.231.201.69",
    "52.42.2.33",
    "52.43.197.121",
    "52.88.113.199",
    "54.200.230.179",
    "54.203.18.234",
    "54.213.7.200",
    # EU
    "3.75.192.192/26",
    "3.121.245.162",
    "18.184.141.112",
    "18.193.166.115",
    # APAC
    "3.27.79.192/26"
  ]
  description = "List of allowed Lacework ip addresses. See https://docs.lacework.net/onboarding/lacework-outbound-ips#docusaurus_skipToContent_fallback. Requires `use_storage_account_network_rules` enabled."
}


