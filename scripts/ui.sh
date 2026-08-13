#!/usr/bin/env bash
set -euo pipefail
S="$(kubectl -n falco get svc -o name | grep 'falcosidekick.*ui' | head -1)"
test -n "$S" || { kubectl -n falco get svc; exit 1; }
echo "UI: http://127.0.0.1:2802"
kubectl -n falco port-forward "$S" 2802:2802
