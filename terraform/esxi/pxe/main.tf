#########################################
#  ESXI Provider host/login details
#########################################
#
#   Use of variables here to hide/move the variables to a separate file
#

provider "esxi" {
  esxi_hostname = var.esxi_hostname
  esxi_hostport = var.esxi_hostport
  esxi_hostssl  = var.esxi_hostssl
  esxi_username = var.esxi_username
  esxi_password = var.esxi_password
}

#########################################
#  Resource Pools
#########################################
# resource "esxi_resource_pool" "Terraform" {
#   resource_pool_name = "Terraform"
#   cpu_min            = "100"
#   cpu_min_expandable = "true"
#   cpu_max            = "8000"
#   cpu_shares         = "normal"
#   mem_min            = "200"
#   mem_min_expandable = "false"
#   mem_max            = "8192"
#   mem_shares         = "normal"
# }
# 
# resource "esxi_resource_pool" "pool1" {
#   resource_pool_name = "${esxi_resource_pool.Terraform.resource_pool_name}/pool1"
# }

#########################################
#  ESXI vSwitch resource
#########################################
#
#  Example vswitch with defaults.
#  Uncommend the uplink block to connect this vswitch to your nic.
#

#########################################
#  ESXI Port Group resource
#########################################
#
#  Example port group with default, connecting to the above vswitch.
#

#########################################
#  ESXI Guest resource
#########################################
#
#  This Guest VM is "bare-metal".   It will be powered on by default
#  by terraform, but it will not boot to any OS.   It will however attempt
#  to network boot.
#
resource "esxi_guest" "vmtest01" {
  guest_name = "vmtest01" # Required, Specify the Guest Name
  disk_store = "synology101"   # Required, Specify an existing Disk Store
  boot_disk_type = "thin"
  guestos    = "ubuntu-64"
  boot_disk_size = "32"
  memsize            = "2048"
  numvcpus           = "4"
  network_interfaces {
    virtual_network = "eno2" # Required for each network interface, Specify the Virtual Network name. PXE booting expected
  }
}