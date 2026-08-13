#!/usr/bin/env bash
set -euo pipefail
D="$(dirname "$0")"
"$D/test-informational.sh"; sleep 2
"$D/test-critical.sh"; sleep 2
"$D/test-emergency.sh"
echo "All 3 alerts triggered. Refresh Falcosidekick UI."
