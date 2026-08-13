#!/usr/bin/env bash
set -euo pipefail
kubectl -n falco-demo exec vulnerable-demo -- sh -c 'echo "# omsl-demo" >> /etc/shadow'
echo "Triggered: EMERGENCY / OMSL Write Shadow File"
