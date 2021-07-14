#!/bin/bash

# create_cluster.sh
# Version: v1.0.0
# Author: Piaras Hoban <phoban01@gmail.com>

set -o errexit

cat <<EOF | kind create cluster --config -
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
name: $1
nodes:
- role: control-plane
- role: worker
EOF
