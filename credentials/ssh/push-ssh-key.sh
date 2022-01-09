#! /bin/bash

# Detect if the secret already exists

if ! lpass show --field=NoteType homelab/homelab-ssh-key &> /dev/null; then
    # Add a blank ssh-key note
    echo '' | lpass add --sync=no --non-interactive --note-type=ssh-key homelab/homelab-ssh-key
    lpass sync
fi

# Update the public key
cat id_ed25519.pub | lpass edit --sync=no --non-interactive --field="Public Key" homelab/homelab-ssh-key

# Update the private key
cat id_ed25519 | lpass edit --sync=no --non-interactive --field="Private Key" homelab/homelab-ssh-key

lpass sync
