output "objects" {
  value = tomap(
    {
      (var.landingzone.key) = merge({
        for key, value in module.enterprise_scale : key => value
        if try(value, {}) != {}
      }, { "diagnostics" = local.diagnostics }, { "global_settings" = local.global_settings }, { vnets = local.vnets }, { keyvaults = local.keyvaults })
    }
  )
  sensitive = true
}

output "global_settings" {
  value     = local.global_settings
  sensitive = true
}

output "diagnostics" {
  value     = local.diagnostics
  sensitive = true
}

output "tfstates" {
  value     = local.tfstates
  sensitive = true
}

output "launchpad_identities" {
  value     = var.propagate_launchpad_identities ? data.terraform_remote_state.remote[var.landingzone.global_settings_key].outputs.launchpad_identities : {}
  sensitive = true
}
