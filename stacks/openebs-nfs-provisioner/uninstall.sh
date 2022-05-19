#!/bin/sh

set -e

################################################################################
# chart
################################################################################
STACK="openebs-nfs-provisioner"
NAMESPACE="openebs"


helm uninstall "$STACK" \
  --namespace "$NAMESPACE"
