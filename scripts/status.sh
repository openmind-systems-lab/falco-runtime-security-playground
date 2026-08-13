#!/usr/bin/env bash
set -euo pipefail
kubectl -n falco get pods,svc
kubectl -n falco-demo get pod -o wide
