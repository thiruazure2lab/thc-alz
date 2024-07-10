# virtual_machines = {

#   vmtest_mgmt01 = {
#     resource_group_key = "thcalz_mgmt_test_rg"
#     # when boot_diagnostics_storage_account_key is empty string "", boot diagnostics will be put on azure managed storage
#     # when boot_diagnostics_storage_account_key is a non-empty string, it needs to point to the key of a user managed storage defined in diagnostic_storage_accounts
#     # if boot_diagnostics_storage_account_key is not defined, but global_settings.resource_defaults.virtual_machines.use_azmanaged_storage_for_boot_diagnostics is true, boot diagnostics will be put on azure managed storage
#     # boot_diagnostics_storage_account_key = "bootdiag_region1"
#     provision_vm_agent                   = true

#     os_type = "windows"


#     # when not set the password is auto-generated and stored into the keyvault
#     keyvault_key = "kv_mgmt_l3"

#     # Define the number of networking cards to attach the virtual machine
#     networking_interfaces = {
#       vmtest_mgmt_nic01 = {
#         lz_key                  = "thcalz_level2_mgmt01"
#         vnet_key                = "thcalz_mgmt_vnet"
#         subnet_key              = "infrasn01_subnet"
#         name                    = "vmtest-mgmt-nic01"
#         enable_ip_forwarding    = false
#         internal_dns_name_label = "vmtest-mgmt-nic01"
#         # public_ip_address_key   = "bastion_host_rg1"
#         private_ip_address_allocation = "Static"
#         private_ip_address =  "10.10.40.11"
#         network_security_group = {
#           key = "nsg-test-mgmt"
#         }

#       }
#     }


#     virtual_machine_settings = {
#       windows = {
#         name           = "mgmt_infratest"
#         size           = "Standard_D2s_v3"
#         license_type   = "Windows_Server"
#         admin_username = "adminuser"

#         # Value of the nic keys to attach the VM. The first one in the list is the default nic
#         network_interface_keys = ["vmtest_mgmt_nic01"]

#         zone = "1"

#         os_disk = {
#           name                 = "Server-OS"
#           caching              = "ReadWrite"
#           create_option        = "FromImage"
#           storage_account_type = "Standard_LRS"
#           managed_disk_type    = "StandardSSD_LRS"
#           disk_size_gb         = "128"
#         }

#         source_image_reference = {
#           publisher = "MicrosoftWindowsServer"
#           offer     = "WindowsServer"
#           sku       = "2019-Datacenter"
#           version   = "latest"
#         }

#         winrm = {
#           enable_self_signed = true
#         }

#       }
#     }

#     # data_disks = {
#     #   data1 = {
#     #     name                 = "server1-data1"
#     #     storage_account_type = "Standard_LRS"
#     #     # Only Empty is supported. More community contributions required to cover other scenarios
#     #     create_option = "Empty"
#     #     disk_size_gb  = "10"
#     #     lun           = 1
#     #     zones         = ["1"]
#     #   }
#     # }

#   }
# }
# # diagnostic_storage_accounts = {
# #   # Stores boot diagnostic for region1
# #   bootdiag_region1 = {
# #     name                     = "boot-conn"
# #     resource_group_key       = "thcalz_conn_test_rg"
# #     account_kind             = "StorageV2"
# #     account_tier             = "Standard"
# #     account_replication_type = "LRS"
# #     access_tier              = "Cool"
# #   }
# # }
