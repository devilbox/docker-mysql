#!/usr/bin/env bash
set -e
set -u
set -o pipefail

IMAGE="devilbox/mysql"
TYPE="${1}"
VERSION="${2}"


# Ensure they all have a common entrypoint
if ! docker image inspect "${IMAGE}:${TYPE}-${VERSION}" \
	| grep '"Entrypoint":' -A 1 \
	| grep -E '"/?docker-entrypoint.sh"'; then
	docker image inspect "${IMAGE}:${TYPE}-${VERSION}" | grep -i "entrypoint" || true
	exit 1
fi
