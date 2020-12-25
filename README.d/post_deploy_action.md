# Linux Ansible: `post_deploy` action
This action groups other actions needed when a new machine is deployed:
- [`grow_lvm`](./grow_lvm_action.md): Executes needed tasks after Linux Server deployment.
- [`setup_hostname`](./setup_hostname_action.md): Setups hostname and resets /etc/hosts.

>NOTE: This action reboots the machine.

## Action Variables
Using this action, you will be able to set the following variables:
- `lvmap`: LVM map with desired sizes. Note: size will be allocated iteratively so last partition may always be `+100%FREE`.

## Example:
```yaml
- role: linux-ansible
  vars:
    action: post_deploy
    lvmap:
      "/": "+100%FREE"
```
