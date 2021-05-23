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
| Command | Comment |
| - | - |
| up | Starts the VM. Creates if it doesnt exist.|
| down | Suspends the VM. |
| clean | Destroys the VM |
| status | Checks the VM state |
| config | Validates the VM configuration |
| | |

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
