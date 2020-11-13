#!/usr/bin/env bash
set -e
set -u
set -o pipefail

IMAGE="devilbox/mysql"
TYPE="${1}"
VERSION="${2}"


# Ensure they all have a common entrypoint
docker image inspect "${IMAGE}:${TYPE}-${VERSION}" \
	| grep '"Entrypoint":' -A 1 \
	| grep '"docker-entrypoint.sh"'
