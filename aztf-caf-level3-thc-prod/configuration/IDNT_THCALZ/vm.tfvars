virtual_machines = {

  # addc_test_idnt01 = {
  #   resource_group_key = "thcalz_idnt_test_rg"
  #   # when boot_diagnostics_storage_account_key is empty string "", boot diagnostics will be put on azure managed storage
  #   # when boot_diagnostics_storage_account_key is a non-empty string, it needs to point to the key of a user managed storage defined in diagnostic_storage_accounts
  #   # if boot_diagnostics_storage_account_key is not defined, but global_settings.resource_defaults.virtual_machines.use_azmanaged_storage_for_boot_diagnostics is true, boot diagnostics will be put on azure managed storage
  #   # boot_diagnostics_storage_account_key = "bootdiag_region1"
  #   provision_vm_agent = true

  #   os_type = "windows"


  #   # when not set the password is auto-generated and stored into the keyvault
  #   keyvault_key = "kv1_idnt_l3"

  #   # Define the number of networking cards to attach the virtual machine
  #   networking_interfaces = {
  #     addctest_idnt_nic01 = {
  #       lz_key                  = "thcalz_level2_idnt01"
  #       vnet_key                = "thcalz_idnt_vnet"
  #       subnet_key              = "addcsn01_subnet"
  #       name                    = "addc-testvm-idnt-nic01"
  #       enable_ip_forwarding    = false
  #       internal_dns_name_label = "addc-testvm-idnt-nic01"
  #       # public_ip_address_key   = "bastion_host_rg1"
  #       private_ip_address_allocation = "Static"
  #       private_ip_address            = "10.10.44.10"
  #       network_security_group = {
  #         key = "addc01_testvm_nsg"
  #       }

  #     }
  #   }


  #   virtual_machine_settings = {
  #     windows = {
  #       name           = "idnt-addctest"
  #       size           = "Standard_D2s_v3"
  #       license_type   = "Windows_Server" 
  #       admin_username = "adminuser"

  #       # Value of the nic keys to attach the VM. The first one in the list is the default nic
  #       network_interface_keys = ["addctest_idnt_nic01"]

  #       zone = "1"

  #       os_disk = {
  #         name                 = "Server-OS"
  #         caching              = "ReadWrite"
  #         create_option        = "FromImage"
  #         storage_account_type = "Standard_LRS"
  #         managed_disk_type    = "StandardSSD_LRS"
  #         disk_size_gb         = "128"
  #       }

  #       source_image_reference = {
  #         publisher = "MicrosoftWindowsServer"
  #         offer     = "WindowsServer"
  #         sku       = "2019-Datacenter"
  #         version   = "latest"
  #       }

  #       winrm = {
  #         enable_self_signed = true
  #       }

  #     }
  #   }

  # }


  addc_idnt01 = {
    resource_group_key = "thcalz_idnt_prod_rg"
    # when boot_diagnostics_storage_account_key is empty string "", boot diagnostics will be put on azure managed storage
    # when boot_diagnostics_storage_account_key is a non-empty string, it needs to point to the key of a user managed storage defined in diagnostic_storage_accounts
    # if boot_diagnostics_storage_account_key is not defined, but global_settings.resource_defaults.virtual_machines.use_azmanaged_storage_for_boot_diagnostics is true, boot diagnostics will be put on azure managed storage
    # boot_diagnostics_storage_account_key = "bootdiag_region1"
    provision_vm_agent = true

    os_type = "windows"


    # when not set the password is auto-generated and stored into the keyvault
    keyvault_key = "kv1_idnt_addcl3"

    # Define the number of networking cards to attach the virtual machine
    networking_interfaces = {
      addc_idnt_nic01 = {
        lz_key                        = "thcalz_level2_idnt01"
        vnet_key                      = "thcalz_idnt_vnet"
        subnet_key                    = "addcsn01_subnet"
        name                          = "addc-idnt-nic01"
        enable_ip_forwarding          = false
        internal_dns_name_label       = "addc-idnt-nic01"
        private_ip_address_allocation = "Static"
        private_ip_address            = "10.10.44.11"
        network_security_group = {
          key = "addcprod01_nsg"
        }

      }
    }


    virtual_machine_settings = {
      windows = {
        name           = "THCAZUKSVDC01"
        size           = "Standard_D2as_v5"
        license_type   = "Windows_Server"
        admin_username = "fslocal"

        # Value of the nic keys to attach the VM. The first one in the list is the default nic
        network_interface_keys = ["addc_idnt_nic01"]

        zone = "1"

        os_disk = {
          name                 = "addc-osdisk-pssd-disk01"
          caching              = "ReadWrite"
          create_option        = "FromImage"
          storage_account_type = "Standard_LRS"
          managed_disk_type    = "Premium_LRS"
          disk_size_gb         = "128"
        }

        source_image_reference = {
          publisher = "MicrosoftWindowsServer"
          offer     = "WindowsServer"
          sku       = "2019-Datacenter"
          version   = "latest"
        }

        license_type = "Windows_Server"

        winrm = {
          enable_self_signed = true
        }

      }
    }

  }
}

