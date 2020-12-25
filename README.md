# Linux Ansible
Ansible Role for Linux Server Configuration.

## What can I do with this role?
Different actions are available by changing **`action` variable**. For instance:
```yaml
- name: Create VM
  hosts: localhost
  roles:
  - role: linux-ansible
    vars:
      action: grow_lvm
      lvmap:
        "/": "+100%FREE"
      ...
```
The following actions are available:
- [`grow_lvm`](./README.d/grow_lvm_action.md): Executes needed tasks after Linux Server deployment.
- [`setup_hostname`](./README.d/setup_hostname_action.md): Setups hostname and resets /etc/hosts.
- [`install_docker`](./README.d/install_docker_action.md): Installs Docker Engine.
- [`post_deploy`](./README.d/post_deploy_action.md): Groups needed actions to configure a newly created machine.
