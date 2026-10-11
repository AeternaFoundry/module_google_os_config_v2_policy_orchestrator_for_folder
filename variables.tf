variable "os_config_v2_policy_orchestrator_for_folders" {
  description = <<EOT
Map of os_config_v2_policy_orchestrator_for_folders, attributes below
Required:
    - action
    - folder_id
    - policy_orchestrator_id
    - orchestrated_resource (block):
        - id (optional)
        - os_policy_assignment_v1_payload (optional, block):
            - description (optional)
            - instance_filter (required, block):
                - all (optional)
                - exclusion_labels (optional, block):
                    - labels (optional)
                - inclusion_labels (optional, block):
                    - labels (optional)
                - inventories (optional, block):
                    - os_short_name (required)
                    - os_version (optional)
            - name (optional)
            - os_policies (required, block):
                - allow_no_resource_group_match (optional)
                - description (optional)
                - id (required)
                - mode (required)
                - resource_groups (required, block):
                    - inventory_filters (optional, block):
                        - os_short_name (required)
                        - os_version (optional)
                    - resources (required, block):
                        - exec (optional, block):
                            - enforce (optional, block):
                                - args (optional)
                                - file (optional, block):
                                    - allow_insecure (optional)
                                    - gcs (optional, block):
                                        - bucket (required)
                                        - generation (optional)
                                        - object (required)
                                    - local_path (optional)
                                    - remote (optional, block):
                                        - sha256_checksum (optional)
                                        - uri (required)
                                - interpreter (required)
                                - output_file_path (optional)
                                - script (optional)
                            - validate (required, block):
                                - args (optional)
                                - file (optional, block):
                                    - allow_insecure (optional)
                                    - gcs (optional, block):
                                        - bucket (required)
                                        - generation (optional)
                                        - object (required)
                                    - local_path (optional)
                                    - remote (optional, block):
                                        - sha256_checksum (optional)
                                        - uri (required)
                                - interpreter (required)
                                - output_file_path (optional)
                                - script (optional)
                        - file (optional, block):
                            - content (optional)
                            - file (optional, block):
                                - allow_insecure (optional)
                                - gcs (optional, block):
                                    - bucket (required)
                                    - generation (optional)
                                    - object (required)
                                - local_path (optional)
                                - remote (optional, block):
                                    - sha256_checksum (optional)
                                    - uri (required)
                            - path (required)
                            - permissions (optional)
                            - state (required)
                        - id (required)
                        - pkg (optional, block):
                            - apt (optional, block):
                                - name (required)
                            - deb (optional, block):
                                - pull_deps (optional)
                                - source (required, block):
                                    - allow_insecure (optional)
                                    - gcs (optional, block):
                                        - bucket (required)
                                        - generation (optional)
                                        - object (required)
                                    - local_path (optional)
                                    - remote (optional, block):
                                        - sha256_checksum (optional)
                                        - uri (required)
                            - desired_state (required)
                            - googet (optional, block):
                                - name (required)
                            - msi (optional, block):
                                - properties (optional)
                                - source (required, block):
                                    - allow_insecure (optional)
                                    - gcs (optional, block):
                                        - bucket (required)
                                        - generation (optional)
                                        - object (required)
                                    - local_path (optional)
                                    - remote (optional, block):
                                        - sha256_checksum (optional)
                                        - uri (required)
                            - rpm (optional, block):
                                - pull_deps (optional)
                                - source (required, block):
                                    - allow_insecure (optional)
                                    - gcs (optional, block):
                                        - bucket (required)
                                        - generation (optional)
                                        - object (required)
                                    - local_path (optional)
                                    - remote (optional, block):
                                        - sha256_checksum (optional)
                                        - uri (required)
                            - yum (optional, block):
                                - name (required)
                            - zypper (optional, block):
                                - name (required)
                        - repository (optional, block):
                            - apt (optional, block):
                                - archive_type (required)
                                - components (required)
                                - distribution (required)
                                - gpg_key (optional)
                                - uri (required)
                            - goo (optional, block):
                                - name (required)
                                - url (required)
                            - yum (optional, block):
                                - base_url (required)
                                - display_name (optional)
                                - gpg_keys (optional)
                                - id (required)
                            - zypper (optional, block):
                                - base_url (required)
                                - display_name (optional)
                                - gpg_keys (optional)
                                - id (required)
            - rollout (required, block):
                - disruption_budget (required, block):
                    - fixed (optional)
                    - percent (optional)
                - min_wait_duration (required)
Optional:
    - deletion_policy
    - description
    - labels
    - state
    - orchestration_scope (block):
        - selectors (optional, block):
            - location_selector (optional, block):
                - included_locations (optional)
            - resource_hierarchy_selector (optional, block):
                - included_folders (optional)
                - included_projects (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    action                 = string
    folder_id              = string
    policy_orchestrator_id = string
    deletion_policy        = optional(string)
    description            = optional(string)
    labels                 = optional(map(string))
    state                  = optional(string)
    orchestrated_resource = object({
      id = optional(string)
      os_policy_assignment_v1_payload = optional(object({
        description = optional(string)
        instance_filter = object({
          all = optional(bool)
          exclusion_labels = optional(list(object({
            labels = optional(map(string))
          })))
          inclusion_labels = optional(list(object({
            labels = optional(map(string))
          })))
          inventories = optional(list(object({
            os_short_name = string
            os_version    = optional(string)
          })))
        })
        name = optional(string)
        os_policies = list(object({
          allow_no_resource_group_match = optional(bool)
          description                   = optional(string)
          id                            = string
          mode                          = string
          resource_groups = list(object({
            inventory_filters = optional(list(object({
              os_short_name = string
              os_version    = optional(string)
            })))
            resources = list(object({
              exec = optional(object({
                enforce = optional(object({
                  args = optional(list(string))
                  file = optional(object({
                    allow_insecure = optional(bool)
                    gcs = optional(object({
                      bucket     = string
                      generation = optional(string)
                      object     = string
                    }))
                    local_path = optional(string)
                    remote = optional(object({
                      sha256_checksum = optional(string)
                      uri             = string
                    }))
                  }))
                  interpreter      = string
                  output_file_path = optional(string)
                  script           = optional(string)
                }))
                validate = object({
                  args = optional(list(string))
                  file = optional(object({
                    allow_insecure = optional(bool)
                    gcs = optional(object({
                      bucket     = string
                      generation = optional(string)
                      object     = string
                    }))
                    local_path = optional(string)
                    remote = optional(object({
                      sha256_checksum = optional(string)
                      uri             = string
                    }))
                  }))
                  interpreter      = string
                  output_file_path = optional(string)
                  script           = optional(string)
                })
              }))
              file = optional(object({
                content = optional(string)
                file = optional(object({
                  allow_insecure = optional(bool)
                  gcs = optional(object({
                    bucket     = string
                    generation = optional(string)
                    object     = string
                  }))
                  local_path = optional(string)
                  remote = optional(object({
                    sha256_checksum = optional(string)
                    uri             = string
                  }))
                }))
                path        = string
                permissions = optional(string)
                state       = string
              }))
              id = string
              pkg = optional(object({
                apt = optional(object({
                  name = string
                }))
                deb = optional(object({
                  pull_deps = optional(bool)
                  source = object({
                    allow_insecure = optional(bool)
                    gcs = optional(object({
                      bucket     = string
                      generation = optional(string)
                      object     = string
                    }))
                    local_path = optional(string)
                    remote = optional(object({
                      sha256_checksum = optional(string)
                      uri             = string
                    }))
                  })
                }))
                desired_state = string
                googet = optional(object({
                  name = string
                }))
                msi = optional(object({
                  properties = optional(list(string))
                  source = object({
                    allow_insecure = optional(bool)
                    gcs = optional(object({
                      bucket     = string
                      generation = optional(string)
                      object     = string
                    }))
                    local_path = optional(string)
                    remote = optional(object({
                      sha256_checksum = optional(string)
                      uri             = string
                    }))
                  })
                }))
                rpm = optional(object({
                  pull_deps = optional(bool)
                  source = object({
                    allow_insecure = optional(bool)
                    gcs = optional(object({
                      bucket     = string
                      generation = optional(string)
                      object     = string
                    }))
                    local_path = optional(string)
                    remote = optional(object({
                      sha256_checksum = optional(string)
                      uri             = string
                    }))
                  })
                }))
                yum = optional(object({
                  name = string
                }))
                zypper = optional(object({
                  name = string
                }))
              }))
              repository = optional(object({
                apt = optional(object({
                  archive_type = string
                  components   = list(string)
                  distribution = string
                  gpg_key      = optional(string)
                  uri          = string
                }))
                goo = optional(object({
                  name = string
                  url  = string
                }))
                yum = optional(object({
                  base_url     = string
                  display_name = optional(string)
                  gpg_keys     = optional(list(string))
                  id           = string
                }))
                zypper = optional(object({
                  base_url     = string
                  display_name = optional(string)
                  gpg_keys     = optional(list(string))
                  id           = string
                }))
              }))
            }))
          }))
        }))
        rollout = object({
          disruption_budget = object({
            fixed   = optional(number)
            percent = optional(number)
          })
          min_wait_duration = string
        })
      }))
    })
    orchestration_scope = optional(object({
      selectors = optional(list(object({
        location_selector = optional(object({
          included_locations = optional(list(string))
        }))
        resource_hierarchy_selector = optional(object({
          included_folders  = optional(list(string))
          included_projects = optional(list(string))
        }))
      })))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.os_config_v2_policy_orchestrator_for_folders : (
        v.orchestrated_resource.os_policy_assignment_v1_payload == null || (length(v.orchestrated_resource.os_policy_assignment_v1_payload.os_policies) >= 1)
      )
    ])
    error_message = "Each os_policies list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.os_config_v2_policy_orchestrator_for_folders : (
        v.orchestrated_resource.os_policy_assignment_v1_payload == null || (alltrue([for item in v.orchestrated_resource.os_policy_assignment_v1_payload.os_policies : (length(item.resource_groups) >= 1)]))
      )
    ])
    error_message = "Each resource_groups list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.os_config_v2_policy_orchestrator_for_folders : (
        v.orchestrated_resource.os_policy_assignment_v1_payload == null || (alltrue([for item in v.orchestrated_resource.os_policy_assignment_v1_payload.os_policies : (alltrue([for item in item.resource_groups : (length(item.resources) >= 1)]))]))
      )
    ])
    error_message = "Each resources list must contain at least 1 items"
  }
  # Note: 6 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

