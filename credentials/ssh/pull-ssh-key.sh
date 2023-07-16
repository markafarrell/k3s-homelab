#! /bin/bash

# Update the private key
vlt secrets get --plaintext id_ed25519_b64 | base64 --decode > id_ed25519
chmod 600 id_ed25519

ssh-keygen -y -f id_ed25519 > id_ed25519.pub
