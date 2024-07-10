storage_accounts = {
  level0 = {
    name                     = "saukstflevel0"
    resource_group_key       = "level0"
    account_kind             = "BlobStorage"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    ## These tags must never be changed after being set as they are used by the rover to locate the launchpad and the tfstates
    tags = {
      tfstate   = "level0"
      launchpad = "launchpad"
    }
    containers = {
      tfstate = {
        name = "tfstate"
      }
    }
  }

  level1 = {
    name                     = "saukstflevel1"
    resource_group_key       = "level1"
    account_kind             = "BlobStorage"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    ## These tags must never be changed after being set as they are used by the rover to locate the launchpad and the tfstates
    tags = {
      tfstate   = "level1"
      launchpad = "launchpad"
    }
    containers = {
      tfstate = {
        name = "tfstate"
      }
    }
  }

  level2 = {
    name                     = "saukstflevel2"
    resource_group_key       = "level2"
    account_kind             = "BlobStorage"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    ## These tags must never be changed after being set as they are used by the rover to locate the launchpad and the tfstates
    tags = {
      tfstate   = "level2"
      launchpad = "launchpad"
    }
    containers = {
      tfstate = {
        name = "tfstate"
      }
    }
  }

  level3 = {
    name                     = "saukstflevel3"
    resource_group_key       = "level3"
    account_kind             = "BlobStorage"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    ## These tags must never be changed after being set as they are used by the rover to locate the launchpad and the tfstates
    tags = {
      tfstate   = "level3"
      launchpad = "launchpad"
    }
    containers = {
      tfstate = {
        name = "tfstate"
      }
    }
  }
}
