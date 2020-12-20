FROM python:3.9.1-slim

#ENV ANSIBLE_VAULT_PASSWORD_FILE=/.vaultpass

COPY . /linux-ansible

RUN apt-get update \
    && apt-get install -y ssh \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /root/.ansible/roles/ \
    && ln -sf /linux-ansible /root/.ansible/roles/linux-ansible \
    && pip3 install -r /linux-ansible/requirements.txt

ENTRYPOINT ["ansible-playbook","-i","/inventory","/playbook.yml"]
