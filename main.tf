resource "google_os_config_v2_policy_orchestrator_for_folder" "os_config_v2_policy_orchestrator_for_folders" {
  for_each = var.os_config_v2_policy_orchestrator_for_folders

  action                 = each.value.action
  folder_id              = each.value.folder_id
  policy_orchestrator_id = each.value.policy_orchestrator_id
  deletion_policy        = each.value.deletion_policy
  description            = each.value.description
  labels                 = each.value.labels
  state                  = each.value.state

  orchestrated_resource {
    id = each.value.orchestrated_resource.id
    dynamic "os_policy_assignment_v1_payload" {
      for_each = each.value.orchestrated_resource.os_policy_assignment_v1_payload != null ? [each.value.orchestrated_resource.os_policy_assignment_v1_payload] : []
      content {
        description = os_policy_assignment_v1_payload.value.description
        instance_filter {
          all = os_policy_assignment_v1_payload.value.instance_filter.all
          dynamic "exclusion_labels" {
            for_each = os_policy_assignment_v1_payload.value.instance_filter.exclusion_labels != null ? os_policy_assignment_v1_payload.value.instance_filter.exclusion_labels : []
            content {
              labels = exclusion_labels.value.labels
            }
          }
          dynamic "inclusion_labels" {
            for_each = os_policy_assignment_v1_payload.value.instance_filter.inclusion_labels != null ? os_policy_assignment_v1_payload.value.instance_filter.inclusion_labels : []
            content {
              labels = inclusion_labels.value.labels
            }
          }
          dynamic "inventories" {
            for_each = os_policy_assignment_v1_payload.value.instance_filter.inventories != null ? os_policy_assignment_v1_payload.value.instance_filter.inventories : []
            content {
              os_short_name = inventories.value.os_short_name
              os_version    = inventories.value.os_version
            }
          }
        }
        name = os_policy_assignment_v1_payload.value.name
        dynamic "os_policies" {
          for_each = os_policy_assignment_v1_payload.value.os_policies
          content {
            allow_no_resource_group_match = os_policies.value.allow_no_resource_group_match
            description                   = os_policies.value.description
            id                            = os_policies.value.id
            mode                          = os_policies.value.mode
            dynamic "resource_groups" {
              for_each = os_policies.value.resource_groups
              content {
                dynamic "inventory_filters" {
                  for_each = resource_groups.value.inventory_filters != null ? resource_groups.value.inventory_filters : []
                  content {
                    os_short_name = inventory_filters.value.os_short_name
                    os_version    = inventory_filters.value.os_version
                  }
                }
                dynamic "resources" {
                  for_each = resource_groups.value.resources
                  content {
                    dynamic "exec" {
                      for_each = resources.value.exec != null ? [resources.value.exec] : []
                      content {
                        dynamic "enforce" {
                          for_each = exec.value.enforce != null ? [exec.value.enforce] : []
                          content {
                            args = enforce.value.args
                            dynamic "file" {
                              for_each = enforce.value.file != null ? [enforce.value.file] : []
                              content {
                                allow_insecure = file.value.allow_insecure
                                dynamic "gcs" {
                                  for_each = file.value.gcs != null ? [file.value.gcs] : []
                                  content {
                                    bucket     = gcs.value.bucket
                                    generation = gcs.value.generation
                                    object     = gcs.value.object
                                  }
                                }
                                local_path = file.value.local_path
                                dynamic "remote" {
                                  for_each = file.value.remote != null ? [file.value.remote] : []
                                  content {
                                    sha256_checksum = remote.value.sha256_checksum
                                    uri             = remote.value.uri
                                  }
                                }
                              }
                            }
                            interpreter      = enforce.value.interpreter
                            output_file_path = enforce.value.output_file_path
                            script           = enforce.value.script
                          }
                        }
                        validate {
                          args = exec.value.validate.args
                          dynamic "file" {
                            for_each = exec.value.validate.file != null ? [exec.value.validate.file] : []
                            content {
                              allow_insecure = file.value.allow_insecure
                              dynamic "gcs" {
                                for_each = file.value.gcs != null ? [file.value.gcs] : []
                                content {
                                  bucket     = gcs.value.bucket
                                  generation = gcs.value.generation
                                  object     = gcs.value.object
                                }
                              }
                              local_path = file.value.local_path
                              dynamic "remote" {
                                for_each = file.value.remote != null ? [file.value.remote] : []
                                content {
                                  sha256_checksum = remote.value.sha256_checksum
                                  uri             = remote.value.uri
                                }
                              }
                            }
                          }
                          interpreter      = exec.value.validate.interpreter
                          output_file_path = exec.value.validate.output_file_path
                          script           = exec.value.validate.script
                        }
                      }
                    }
                    dynamic "file" {
                      for_each = resources.value.file != null ? [resources.value.file] : []
                      content {
                        content = file.value.content
                        dynamic "file" {
                          for_each = file.value.file != null ? [file.value.file] : []
                          content {
                            allow_insecure = file.value.allow_insecure
                            dynamic "gcs" {
                              for_each = file.value.gcs != null ? [file.value.gcs] : []
                              content {
                                bucket     = gcs.value.bucket
                                generation = gcs.value.generation
                                object     = gcs.value.object
                              }
                            }
                            local_path = file.value.local_path
                            dynamic "remote" {
                              for_each = file.value.remote != null ? [file.value.remote] : []
                              content {
                                sha256_checksum = remote.value.sha256_checksum
                                uri             = remote.value.uri
                              }
                            }
                          }
                        }
                        path        = file.value.path
                        permissions = file.value.permissions
                        state       = file.value.state
                      }
                    }
                    id = resources.value.id
                    dynamic "pkg" {
                      for_each = resources.value.pkg != null ? [resources.value.pkg] : []
                      content {
                        dynamic "apt" {
                          for_each = pkg.value.apt != null ? [pkg.value.apt] : []
                          content {
                            name = apt.value.name
                          }
                        }
                        dynamic "deb" {
                          for_each = pkg.value.deb != null ? [pkg.value.deb] : []
                          content {
                            pull_deps = deb.value.pull_deps
                            source {
                              allow_insecure = deb.value.source.allow_insecure
                              dynamic "gcs" {
                                for_each = deb.value.source.gcs != null ? [deb.value.source.gcs] : []
                                content {
                                  bucket     = gcs.value.bucket
                                  generation = gcs.value.generation
                                  object     = gcs.value.object
                                }
                              }
                              local_path = deb.value.source.local_path
                              dynamic "remote" {
                                for_each = deb.value.source.remote != null ? [deb.value.source.remote] : []
                                content {
                                  sha256_checksum = remote.value.sha256_checksum
                                  uri             = remote.value.uri
                                }
                              }
                            }
                          }
                        }
                        desired_state = pkg.value.desired_state
                        dynamic "googet" {
                          for_each = pkg.value.googet != null ? [pkg.value.googet] : []
                          content {
                            name = googet.value.name
                          }
                        }
                        dynamic "msi" {
                          for_each = pkg.value.msi != null ? [pkg.value.msi] : []
                          content {
                            properties = msi.value.properties
                            source {
                              allow_insecure = msi.value.source.allow_insecure
                              dynamic "gcs" {
                                for_each = msi.value.source.gcs != null ? [msi.value.source.gcs] : []
                                content {
                                  bucket     = gcs.value.bucket
                                  generation = gcs.value.generation
                                  object     = gcs.value.object
                                }
                              }
                              local_path = msi.value.source.local_path
                              dynamic "remote" {
                                for_each = msi.value.source.remote != null ? [msi.value.source.remote] : []
                                content {
                                  sha256_checksum = remote.value.sha256_checksum
                                  uri             = remote.value.uri
                                }
                              }
                            }
                          }
                        }
                        dynamic "rpm" {
                          for_each = pkg.value.rpm != null ? [pkg.value.rpm] : []
                          content {
                            pull_deps = rpm.value.pull_deps
                            source {
                              allow_insecure = rpm.value.source.allow_insecure
                              dynamic "gcs" {
                                for_each = rpm.value.source.gcs != null ? [rpm.value.source.gcs] : []
                                content {
                                  bucket     = gcs.value.bucket
                                  generation = gcs.value.generation
                                  object     = gcs.value.object
                                }
                              }
                              local_path = rpm.value.source.local_path
                              dynamic "remote" {
                                for_each = rpm.value.source.remote != null ? [rpm.value.source.remote] : []
                                content {
                                  sha256_checksum = remote.value.sha256_checksum
                                  uri             = remote.value.uri
                                }
                              }
                            }
                          }
                        }
                        dynamic "yum" {
                          for_each = pkg.value.yum != null ? [pkg.value.yum] : []
                          content {
                            name = yum.value.name
                          }
                        }
                        dynamic "zypper" {
                          for_each = pkg.value.zypper != null ? [pkg.value.zypper] : []
                          content {
                            name = zypper.value.name
                          }
                        }
                      }
                    }
                    dynamic "repository" {
                      for_each = resources.value.repository != null ? [resources.value.repository] : []
                      content {
                        dynamic "apt" {
                          for_each = repository.value.apt != null ? [repository.value.apt] : []
                          content {
                            archive_type = apt.value.archive_type
                            components   = apt.value.components
                            distribution = apt.value.distribution
                            gpg_key      = apt.value.gpg_key
                            uri          = apt.value.uri
                          }
                        }
                        dynamic "goo" {
                          for_each = repository.value.goo != null ? [repository.value.goo] : []
                          content {
                            name = goo.value.name
                            url  = goo.value.url
                          }
                        }
                        dynamic "yum" {
                          for_each = repository.value.yum != null ? [repository.value.yum] : []
                          content {
                            base_url     = yum.value.base_url
                            display_name = yum.value.display_name
                            gpg_keys     = yum.value.gpg_keys
                            id           = yum.value.id
                          }
                        }
                        dynamic "zypper" {
                          for_each = repository.value.zypper != null ? [repository.value.zypper] : []
                          content {
                            base_url     = zypper.value.base_url
                            display_name = zypper.value.display_name
                            gpg_keys     = zypper.value.gpg_keys
                            id           = zypper.value.id
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
        rollout {
          disruption_budget {
            fixed   = os_policy_assignment_v1_payload.value.rollout.disruption_budget.fixed
            percent = os_policy_assignment_v1_payload.value.rollout.disruption_budget.percent
          }
          min_wait_duration = os_policy_assignment_v1_payload.value.rollout.min_wait_duration
        }
      }
    }
  }

  dynamic "orchestration_scope" {
    for_each = each.value.orchestration_scope != null ? [each.value.orchestration_scope] : []
    content {
      dynamic "selectors" {
        for_each = orchestration_scope.value.selectors != null ? orchestration_scope.value.selectors : []
        content {
          dynamic "location_selector" {
            for_each = selectors.value.location_selector != null ? [selectors.value.location_selector] : []
            content {
              included_locations = location_selector.value.included_locations
            }
          }
          dynamic "resource_hierarchy_selector" {
            for_each = selectors.value.resource_hierarchy_selector != null ? [selectors.value.resource_hierarchy_selector] : []
            content {
              included_folders  = resource_hierarchy_selector.value.included_folders
              included_projects = resource_hierarchy_selector.value.included_projects
            }
          }
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

