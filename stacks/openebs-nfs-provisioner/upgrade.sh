#!/bin/sh

set -e

################################################################################
# repo
################################################################################
helm repo add openebs-nfs https://openebs.github.io/dynamic-nfs-provisioner
helm repo update > /dev/null

################################################################################
# chart
################################################################################
STACK="openebs-nfs"
CHART="openebs-nfs/nfs-provisioner"
NAMESPACE="openebs"

if [ -z "${MP_KUBERNETES}" ]; then
    # use local version of values.yml
    ROOT_DIR=$(git rev-parse --show-toplevel)
    values="$ROOT_DIR/stacks/openebs-nfs/values.yml"
else
    # use github hosted master version of values.yml
    values="https://raw.githubusercontent.com/digitalocean/marketplace-kubernetes/master/stacks/openebs-nfs/values.yml"
fi

helm upgrade "$STACK" "$CHART" \
--namespace "$NAMESPACE" \
--values "$values" \
