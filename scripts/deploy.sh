#!/usr/bin/env bash
set -euo pipefail
C="${CLUSTER_NAME:-falco-runtime-security}"
R="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
for x in docker kind kubectl helm; do command -v "$x" >/dev/null || { echo "Missing: $x"; exit 1; }; done
if [[ "$(uname -s)" == Darwin ]]; then
  echo "NOTE: Falco/Kind syscall capture on macOS depends on Docker Desktop's Linux VM. If modern eBPF cannot initialize, use a Linux VM."
fi
kind get clusters | grep -qx "$C" || kind create cluster --name "$C" --config "$R/kind-config.yaml"
helm repo add falcosecurity https://falcosecurity.github.io/charts >/dev/null 2>&1 || true
helm repo update falcosecurity
helm upgrade --install falco falcosecurity/falco -n falco --create-namespace -f "$R/falco/values.yaml" --wait --timeout 10m
kubectl apply -f "$R/k8s/demo-pod.yaml"
kubectl -n falco-demo wait --for=condition=Ready pod/vulnerable-demo --timeout=120s
echo "Ready. Run: make ui"
