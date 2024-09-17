#!/bin/sh

KONG_ADMIN_HOST=localhost
KONG_ADMIN_TOKEN=adminPass

podman run -i --network="host" -v $(pwd):/deck --workdir /deck kong/deck --kong-addr http://${KONG_ADMIN_HOST}:8001 --headers kong-admin-token:${KONG_ADMIN_TOKEN} gateway sync /deck/kong_export.yaml
