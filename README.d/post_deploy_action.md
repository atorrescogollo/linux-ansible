# Linux Ansible: `post_deploy` action
This action groups other actions needed when a new machine is deployed:
- [`upgrade_packages`](./upgrade_packages_action.md): Upgrades all packages and distribution.
- [`grow_lvm`](./grow_lvm_action.md): Executes needed tasks after Linux Server deployment.
- [`setup_hostname`](./setup_hostname_action.md): Setups hostname and resets /etc/hosts.
> **NOTES**:
> - Only Ubuntu and Debian are supported
> - This action reboots the machine.

## Action Variables
Using this action, you will be able to set the following variables:
- `lvmap`: LVM map with desired sizes. Note: size will be allocated iteratively so last partition may always be `+100%FREE`.
- `install_packages`: Extra packages you want to be installed.

## Example:
```yaml
- role: linux-ansible
  vars:
    action: post_deploy
    lvmap:
      "/": "+100%FREE"
    install_packages:
    - vim
```
