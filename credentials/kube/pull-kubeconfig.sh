#! /bin/bash

# Pull the kubeconfig key
vlt secrets get --plaintext kubeconfig_b64 | base64 --decode > config
