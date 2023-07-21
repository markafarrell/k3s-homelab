#! /bin/bash

# Push the kubeconfig

vlt secrets update kubeconfig_b64=$(base64 -w0 config)
