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
resource "esxi_vswitch" "vspublic" {
  name = "vs-public"
  #uplink {
  #  name = "vmnic1"
  #}
}

#########################################
#  ESXI Port Group resource
#########################################
#
#  Example port group with default, connecting to the above vswitch.
#
resource "esxi_portgroup" "pgpublic" {
  name = "pg-public"
  vswitch = esxi_vswitch.vspublic.name
}

#########################################
#  ESXI Guest resource
#########################################
#
#  This Guest VM is a clone of an existing Guest VM named "centos7" (must exist and
#  be powered off), located in the "Templates" resource pool.  vmtest03 will be powered
#  on by default by terraform.  The virtual network "VM Network", must already exist on
#  your esxi host!
#
resource "esxi_guest" "tmpl-k8s-master" {
  guest_name         = "tmpl-k8s-master"
  disk_store = var.disk_store
  guestos    = "ubuntu-64"
  boot_disk_type = "thin"
  boot_disk_size = "32"
  memsize            = "2048"
  numvcpus           = "2"
  # resource_pool_name = esxi_resource_pool.pool1.resource_pool_name
  network_interfaces {
    virtual_network = esxi_portgroup.pgpublic.name  # Connecting to the above portgroup
  }
}
resource "esxi_guest" "tmpl-k8s-worker" {
  guest_name         = "tmpl-k8s-worker"
  disk_store = var.disk_store
  guestos    = "ubuntu-64"
  boot_disk_type = "thin"
  boot_disk_size = "64"
  memsize            = "8192"
  numvcpus           = "8"
  # resource_pool_name = esxi_resource_pool.pool1.resource_pool_name
  network_interfaces {
    virtual_network = esxi_portgroup.pgpublic.name  # Connecting to the above portgroup
  }
}