
#
#  See https://www.terraform.io/intro/getting-started/variables.html for more details.
#

#  Change these defaults to fit your needs!

variable "esxi_hostname" {
  default = "esxi1.maas"
}

variable "esxi_hostport" {
  default = "22"
}

variable "esxi_hostssl" {
  default = "443"
}


variable "esxi_username" {
}

variable "esxi_password" { # Unspecified will prompt
}

variable "disk_store" {
  default = "datastore1"
}