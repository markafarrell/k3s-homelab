# k3s-homelab

## System Dependancies

 * python3
 * lastpass-cli (https://github.com/lastpass/lastpass-cli)

## Python Dependancies

 * ansible

## Getting Started

1. Install system dependancies

`apt-install python3 python3-pip lastpass-cli`

2. Install python depancies

`pip3 install ansible`

3. Install ansible depenancies

```
ansible-galaxy install -r roles/requirments.yml
ansible-galaxy collection install -r roles/requirments.yml
```

### Configuring the k3s cluster

1. Run ansible playbook

`ansible-playbook k3s.yml`
