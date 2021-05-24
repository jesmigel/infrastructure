# vagrant-esxi
Proof of concept remote rapid prototyping solution

### Dependencies
| Dependency | Comment |
| - | - |
| [Vagrant](https://www.vagrantup.com/) | Virtual Machine manager |
| [ESXI (6.7u3)](https://my.vmware.com/en/group/vmware/evalcenter?p=free-esxi6) | Hypervisor |
| | |

### References
| Reference | Comment |
| - | - |
| [vagrant-vmware-esxi](https://github.com/josenk/vagrant-vmware-esxi) | Vagrant plugin for vmware esxi |
| | |

### Makefile Commands
| Command | Comments |
| - | - |
| clean | Destroys virtualmachine. Deletes vagrant cache folder |
| config | Validates vagrant configuration |
| down | Suspends the virtualmachine |
| login | ssh to the virtualmachine |
| provision | Executes the selected provisioner. For this example, it's ansible |
| status | Checks the VM state |
| up | Starts the VM. Creates if it doesnt exist. |
|||

### USAGE
```bash
# Create and populate configuration payload 'env.yaml'
cp sample.env.yaml env.yaml
vi env.yaml

# Validate configuration
make config

# Deploy VM
make up


```
