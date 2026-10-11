output "os_config_v2_policy_orchestrator_for_folders_id" {
  description = "Map of id values across all os_config_v2_policy_orchestrator_for_folders, keyed the same as var.os_config_v2_policy_orchestrator_for_folders except keys with no id are omitted"
  value       = { for k, v in google_os_config_v2_policy_orchestrator_for_folder.os_config_v2_policy_orchestrator_for_folders : k => v.id if v.id != null && length(v.id) > 0 }
}
output "os_config_v2_policy_orchestrator_for_folders_action" {
  description = "Map of action values across all os_config_v2_policy_orchestrator_for_folders, keyed the same as var.os_config_v2_policy_orchestrator_for_folders except keys with no action are omitted"
  value       = { for k, v in google_os_config_v2_policy_orchestrator_for_folder.os_config_v2_policy_orchestrator_for_folders : k => v.action if v.action != null && length(v.action) > 0 }
}
output "os_config_v2_policy_orchestrator_for_folders_create_time" {
  description = "Map of create_time values across all os_config_v2_policy_orchestrator_for_folders, keyed the same as var.os_config_v2_policy_orchestrator_for_folders except keys with no create_time are omitted"
  value       = { for k, v in google_os_config_v2_policy_orchestrator_for_folder.os_config_v2_policy_orchestrator_for_folders : k => v.create_time if v.create_time != null && length(v.create_time) > 0 }
}
output "os_config_v2_policy_orchestrator_for_folders_deletion_policy" {
  description = "Map of deletion_policy values across all os_config_v2_policy_orchestrator_for_folders, keyed the same as var.os_config_v2_policy_orchestrator_for_folders except keys with no deletion_policy are omitted"
  value       = { for k, v in google_os_config_v2_policy_orchestrator_for_folder.os_config_v2_policy_orchestrator_for_folders : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "os_config_v2_policy_orchestrator_for_folders_description" {
  description = "Map of description values across all os_config_v2_policy_orchestrator_for_folders, keyed the same as var.os_config_v2_policy_orchestrator_for_folders except keys with no description are omitted"
  value       = { for k, v in google_os_config_v2_policy_orchestrator_for_folder.os_config_v2_policy_orchestrator_for_folders : k => v.description if v.description != null && length(v.description) > 0 }
}
output "os_config_v2_policy_orchestrator_for_folders_effective_labels" {
  description = "Map of effective_labels values across all os_config_v2_policy_orchestrator_for_folders, keyed the same as var.os_config_v2_policy_orchestrator_for_folders except keys with no effective_labels are omitted"
  value       = { for k, v in google_os_config_v2_policy_orchestrator_for_folder.os_config_v2_policy_orchestrator_for_folders : k => v.effective_labels if v.effective_labels != null && length(v.effective_labels) > 0 }
}
output "os_config_v2_policy_orchestrator_for_folders_etag" {
  description = "Map of etag values across all os_config_v2_policy_orchestrator_for_folders, keyed the same as var.os_config_v2_policy_orchestrator_for_folders except keys with no etag are omitted"
  value       = { for k, v in google_os_config_v2_policy_orchestrator_for_folder.os_config_v2_policy_orchestrator_for_folders : k => v.etag if v.etag != null && length(v.etag) > 0 }
}
output "os_config_v2_policy_orchestrator_for_folders_folder_id" {
  description = "Map of folder_id values across all os_config_v2_policy_orchestrator_for_folders, keyed the same as var.os_config_v2_policy_orchestrator_for_folders except keys with no folder_id are omitted"
  value       = { for k, v in google_os_config_v2_policy_orchestrator_for_folder.os_config_v2_policy_orchestrator_for_folders : k => v.folder_id if v.folder_id != null && length(v.folder_id) > 0 }
}
output "os_config_v2_policy_orchestrator_for_folders_labels" {
  description = "Map of labels values across all os_config_v2_policy_orchestrator_for_folders, keyed the same as var.os_config_v2_policy_orchestrator_for_folders except keys with no labels are omitted"
  value       = { for k, v in google_os_config_v2_policy_orchestrator_for_folder.os_config_v2_policy_orchestrator_for_folders : k => v.labels if v.labels != null && length(v.labels) > 0 }
}
output "os_config_v2_policy_orchestrator_for_folders_name" {
  description = "Map of name values across all os_config_v2_policy_orchestrator_for_folders, keyed the same as var.os_config_v2_policy_orchestrator_for_folders except keys with no name are omitted"
  value       = { for k, v in google_os_config_v2_policy_orchestrator_for_folder.os_config_v2_policy_orchestrator_for_folders : k => v.name if v.name != null && length(v.name) > 0 }
}
output "os_config_v2_policy_orchestrator_for_folders_orchestrated_resource" {
  description = "Map of orchestrated_resource values across all os_config_v2_policy_orchestrator_for_folders, keyed the same as var.os_config_v2_policy_orchestrator_for_folders except keys with no orchestrated_resource are omitted"
  value       = { for k, v in google_os_config_v2_policy_orchestrator_for_folder.os_config_v2_policy_orchestrator_for_folders : k => one(v.orchestrated_resource) if v.orchestrated_resource != null && length(v.orchestrated_resource) > 0 }
}
output "os_config_v2_policy_orchestrator_for_folders_orchestration_scope" {
  description = "Map of orchestration_scope values across all os_config_v2_policy_orchestrator_for_folders, keyed the same as var.os_config_v2_policy_orchestrator_for_folders except keys with no orchestration_scope are omitted"
  value       = { for k, v in google_os_config_v2_policy_orchestrator_for_folder.os_config_v2_policy_orchestrator_for_folders : k => one(v.orchestration_scope) if v.orchestration_scope != null && length(v.orchestration_scope) > 0 }
}
output "os_config_v2_policy_orchestrator_for_folders_orchestration_state" {
  description = "Map of orchestration_state values across all os_config_v2_policy_orchestrator_for_folders, keyed the same as var.os_config_v2_policy_orchestrator_for_folders except keys with no orchestration_state are omitted"
  value       = { for k, v in google_os_config_v2_policy_orchestrator_for_folder.os_config_v2_policy_orchestrator_for_folders : k => v.orchestration_state if v.orchestration_state != null && length(v.orchestration_state) > 0 }
}
output "os_config_v2_policy_orchestrator_for_folders_policy_orchestrator_id" {
  description = "Map of policy_orchestrator_id values across all os_config_v2_policy_orchestrator_for_folders, keyed the same as var.os_config_v2_policy_orchestrator_for_folders except keys with no policy_orchestrator_id are omitted"
  value       = { for k, v in google_os_config_v2_policy_orchestrator_for_folder.os_config_v2_policy_orchestrator_for_folders : k => v.policy_orchestrator_id if v.policy_orchestrator_id != null && length(v.policy_orchestrator_id) > 0 }
}
output "os_config_v2_policy_orchestrator_for_folders_reconciling" {
  description = "Map of reconciling values across all os_config_v2_policy_orchestrator_for_folders, keyed the same as var.os_config_v2_policy_orchestrator_for_folders except keys with no reconciling are omitted"
  value       = { for k, v in google_os_config_v2_policy_orchestrator_for_folder.os_config_v2_policy_orchestrator_for_folders : k => v.reconciling if v.reconciling != null }
}
output "os_config_v2_policy_orchestrator_for_folders_state" {
  description = "Map of state values across all os_config_v2_policy_orchestrator_for_folders, keyed the same as var.os_config_v2_policy_orchestrator_for_folders except keys with no state are omitted"
  value       = { for k, v in google_os_config_v2_policy_orchestrator_for_folder.os_config_v2_policy_orchestrator_for_folders : k => v.state if v.state != null && length(v.state) > 0 }
}
output "os_config_v2_policy_orchestrator_for_folders_terraform_labels" {
  description = "Map of terraform_labels values across all os_config_v2_policy_orchestrator_for_folders, keyed the same as var.os_config_v2_policy_orchestrator_for_folders except keys with no terraform_labels are omitted"
  value       = { for k, v in google_os_config_v2_policy_orchestrator_for_folder.os_config_v2_policy_orchestrator_for_folders : k => v.terraform_labels if v.terraform_labels != null && length(v.terraform_labels) > 0 }
}
output "os_config_v2_policy_orchestrator_for_folders_update_time" {
  description = "Map of update_time values across all os_config_v2_policy_orchestrator_for_folders, keyed the same as var.os_config_v2_policy_orchestrator_for_folders except keys with no update_time are omitted"
  value       = { for k, v in google_os_config_v2_policy_orchestrator_for_folder.os_config_v2_policy_orchestrator_for_folders : k => v.update_time if v.update_time != null && length(v.update_time) > 0 }
}

