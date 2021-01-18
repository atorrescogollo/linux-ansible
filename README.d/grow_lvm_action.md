# Linux Ansible: `grow_lvm` action
Extends LVM logical volumes as specified

## Action Variables
Using this action, you will be able to set the following variables:
- `lvmap`: LVM map with desired sizes. Note: size will be allocated iteratively so last partition may always be `+100%FREE`.
- `lvmap_ignore_errors`: Ignore errors when extending logical volumes. Default: no.

## Example:
```yaml
- role: linux-ansible
  vars:
    action: grow_lvm
    lvmap:
      "/var": "4G"
      "/var/log": "2G"
      "/": "+100%FREE"
    lvmap_ignore_errors: yes
```
