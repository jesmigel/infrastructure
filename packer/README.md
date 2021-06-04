# [Packer](https://www.packer.io/docs)
HashiCorp Packer automates the creation of any type of machine image. Machine images may include but are not limited to virtual machine snapshots and/or container images.

### Reference
| Label | Comment |
| - | - |
| [packer-esxi](https://github.com/nickcharlton/packer-esxi) | ESXI used as the platform by packer to build vmware vmdk image snapshots |
|  |  |

### Workflow
ToDo: Replace with diagram
- Vagrant (Targets esxi, creates packer host)
- Ansible (Generates packer code from templates)
- Ansible (Build image, targets ESXI, exports ESXI)
- Ansible (test image, ESXI as platform)
- Cleanup

### Known Issues
| Label | Comment |
| - | - |
| [ESXI Firewall](https://github.com/chrisipa/packer-esxi#allow-network-communication-for-packer) | ESXI firewall constraint |
|  |  |