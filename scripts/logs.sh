#!/usr/bin/env bash
set -euo pipefail
kubectl -n falco logs -l app.kubernetes.io/name=falco -c falco --tail=100 -f
