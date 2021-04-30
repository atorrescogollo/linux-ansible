# Linux Ansible: `install_docker` action
Installs Docker Engine
> **NOTE**: Only Ubuntu and Debian are supported

## Action Variables
Using this action, you will be able to set the following variables:
- `docker_compose_version`: Version for docker-compose. Available releases can be found [here](https://github.com/docker/compose/releases/). Default: `latest`.

## Example:
```yaml
- role: linux-ansible
  vars:
    action: install_docker
    docker_compose_version: 1.29.1
```
