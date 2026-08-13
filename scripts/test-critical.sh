#!/usr/bin/env bash
set -euo pipefail
kubectl -n falco-demo exec vulnerable-demo -- cat /etc/shadow >/dev/null
echo "Triggered: CRITICAL / OMSL Read Shadow File"
