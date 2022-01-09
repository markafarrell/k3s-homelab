#! /bin/bash

# Detect if the secret already exists

if ! lpass show --field=NoteType homelab/homelab-kubeconfig &> /dev/null; then
    # Add a blank note
    echo '' | lpass add --sync=no --non-interactive homelab/homelab-kubeconfig
    lpass sync
fi

# Update kubeconfig
cat config | lpass edit --sync=no --non-interactive --notes homelab/homelab-kubeconfig

lpass sync
