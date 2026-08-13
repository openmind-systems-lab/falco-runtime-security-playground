#!/usr/bin/env bash
set -euo pipefail
kubectl -n falco-demo exec vulnerable-demo -- chmod 600 /tmp/shadow
echo "Triggered: INFORMATIONAL / OMSL Root Chmod In Container"
