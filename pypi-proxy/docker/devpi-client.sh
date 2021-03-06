#!/bin/bash

set -euo pipefail

IFS=$'\n\t'

devpi use http://localhost:3141 > /dev/null 2>&1
devpi login root --password=$(cat "$DEVPI_SERVER_ROOT/.root_password")

if [ "${1:-}" == "bash" ]; then
    exec "$@"
fi
exec devpi "$@"