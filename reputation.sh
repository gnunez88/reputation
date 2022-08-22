#!/usr/bin/env bash

HOST="${1:-Hostname/domain missing}"

TALOS="https://talosintelligence.com/cloud_intel/host_info"
URL="${TALOS}?hostname=${HOST}"
UA="Mozilla"

(echo "Address Reputation Calification";
curl -sS "${URL}" -A "${UA}" \
    | jq '.related_ips[]|.address,.reputation_x10,.threat_level_mnemonic' \
    | xargs -n3) | column -t
