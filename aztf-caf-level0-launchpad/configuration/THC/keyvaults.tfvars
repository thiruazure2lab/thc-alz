keyvaults = {
  level0 = {
    name                = "kv-uks-tf-level0"
    resource_group_key  = "level0"
    sku_name            = "standard"
    soft_delete_enabled = false
    
    ## These tags must never be changed after being set as they are used by the rover to locate the launchpad and the tfstates
    tags = {
      tfstate = "level0"
    }

    creation_policies = {
      logged_in_user = {
        # if the key is set to "logged_in_user" add the user running terraform in the keyvault policy
        # More examples in /examples/keyvault
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
    }
  }

  level1 = {
    name                = "kv-uks-tf-level1"
    resource_group_key  = "level1"
    sku_name            = "standard"
    soft_delete_enabled = false
    
    ## These tags must never be changed after being set as they are used by the rover to locate the launchpad and the tfstates
    tags = {
      tfstate = "level1"
    }

    creation_policies = {
      logged_in_user = {
        # if the key is set to "logged_in_user" add the user running terraform in the keyvault policy
        # More examples in /examples/keyvault
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
    }
    
  }

  level2 = {
    name                = "kv-uks-tf-level2"
    resource_group_key  = "level2"
    sku_name            = "standard"
    soft_delete_enabled = false

    ## These tags must never be changed after being set as they are used by the rover to locate the launchpad and the tfstates
    tags = {
      tfstate = "level2"
    }
    
    creation_policies = {
      logged_in_user = {
        # if the key is set to "logged_in_user" add the user running terraform in the keyvault policy
        # More examples in /examples/keyvault
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
    }
  }

  level3 = {
    name                = "kv-uks-tf-level3"
    resource_group_key  = "level3"
    sku_name            = "standard"
    soft_delete_enabled = false

    ## These tags must never be changed after being set as they are used by the rover to locate the launchpad and the tfstates
    tags = {
      tfstate = "level3"
    }
    
    creation_policies = {
      logged_in_user = {
        # if the key is set to "logged_in_user" add the user running terraform in the keyvault policy
        # More examples in /examples/keyvault
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
    }
  }
}
