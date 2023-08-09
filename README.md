# k3s-homelab

## System Dependancies

 * python3
 * vlt (https://developer.hashicorp.com/vault/tutorials/hcp-vault-secrets-get-started/hcp-vault-secrets-install-cli)

## Python Dependancies

 * ansible


## Creating Image

1. Install `sdm`

`curl -L https://raw.githubusercontent.com/gitbls/sdm/master/EZsdmInstaller | bash`

2. Create image directory

```
mkdir images
cd images
```

3. Download Raspberry Pi OS (64-bit) Lite image from https://www.raspberrypi.com/software/operating-systems/

```
curl https://downloads.raspberrypi.org/raspios_lite_arm64/images/raspios_lite_arm64-2023-05-03/2023-05-03-raspios-bullseye-arm64-lite.img.xz -O
xz -d -v 2023-05-03-raspios-bullseye-arm64-lite.img.xz
```

4. Customise image

```
echo exit | sudo /usr/local/sdm/sdm --customize 2023-05-03-raspios-bullseye-arm64-lite.img --nowpa --disable bluetooth,piwiz,swap,triggerhappy,wifi --L10n --password-pi raspberry --restart
```

5. Burn image

```
sudo umount /dev/mmcblk0*;
sudo /usr/local/sdm/sdm --burn /dev/mmcblk0 --hostname <hostname> 2023-05-03-raspios-bullseye-arm64-lite.img
```

## Getting Started

1. Install system dependancies

```
sudo apt update

curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update
sudo apt install python3 python3-pip vlt
```

2. Install python depancies

`pip3 install ansible kubernetes`

3. Install ansible depenancies

```
ansible-galaxy install -r roles/requirements.yml
ansible-galaxy collection install -r roles/requirements.yml
```

4. Install helm

```
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
```

### Get SSH Private Key

```
cd credentials/ssh
./pull-ssh-key.sh
```

### Get Kubeconfig

```
cd credentials/kube
./pull-kubeconfig.sh
```

### Configure kubectl

```
source .env
kubectl get nodes
```

### Configuring the k3s cluster

1. Configure base os

`vlt run -c "ansible-playbook base.yml"`

2. Install and configure k3s

`vlt run -c "ansible-playbook k3s.yml"`
