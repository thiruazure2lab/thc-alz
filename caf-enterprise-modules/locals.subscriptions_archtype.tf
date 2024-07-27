locals{
    es_landing_zones_subs_map = {
    for key, value in var.es_subs_archtype_map :
    "${local.provider_path.management_groups}${key}" => {
      id                         = value.id
      display_name               = value.display_name
      parent_management_group_id = try(length(value.parent_management_group_id) > 0, false) ? replace(lower(value.parent_management_group_id), "/[^a-z0-9]/", "-") : local.root_parent_id
      archetype_config = {
        archetype_id   = value.archetype_config.archetype_id
        access_control = value.archetype_config.access_control
        parameters = merge(
          try(module.management_resources.configuration.archetype_config_overrides[key].parameters, null),
          value.archetype_config.parameters,
        )
      }
    }
  }
}