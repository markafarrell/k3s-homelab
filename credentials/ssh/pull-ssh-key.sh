#! /bin/bash

# Pull the public key
lpass show --field="Public Key" homelab/homelab-ssh-key > id_ed25519.pub

# Update the private key
lpass show --field="Private Key" homelab/homelab-ssh-key > id_ed25519
chmod 600 id_ed25519
