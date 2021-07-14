#!/bin/bash

# bootstrap_flux.sh
# Version: v1.0.0
# Author: Piaras Hoban <phoban01@gmail.com>

set -o errexit

if ! [ -x "$(command -v gh)" ]; then
  echo 'Error: GitHub CLI is not installed. Please visit https://cli.github.com/manual/installation for install instructions.' >&2
  exit 1
fi

flux bootstrap github \
    --owner $(gh repo view --json 'owner' --jq '.owner.login') \
    --repository $(gh repo view --json 'name' --jq '.name') \
    --path ./cluster/flux-demo
