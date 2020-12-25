# Linux Ansible: `upgrade_packages` action
Upgrades all packages and distribution. Also, can install packages you want by setting `install_packages`.
> **NOTE**: Only Ubuntu and Debian are supported

## Action Variables
Using this action, you will be able to set the following variables:
- `install_packages`: Extra packages you want to be installed.

## Example:
```yaml
- role: linux-ansible
  vars:
    action: upgrade_packages
    install_packages:
    - vim
    - tmux
```
