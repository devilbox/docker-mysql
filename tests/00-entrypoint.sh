#!/usr/bin/env bash
set -e
set -u
set -o pipefail

IMAGE="devilbox/mysql"
#NAME="${1}"
#VERSION="${2}"
TAG="${3}"
#ARCH="${4}"

CWD="$(cd -P -- "$(dirname -- "$0")" && pwd -P)"
# shellcheck disable=SC1090
. "${CWD}/.lib.sh"

# Ensure they all have a common entrypoint
if ! run "docker image inspect ${IMAGE}:${TAG}" \
	| grep '"Entrypoint":' -A 1 \
	| grep -E '"/?docker-entrypoint.sh"'; then
	docker image inspect "${IMAGE}:${TAG}" | grep -i "entrypoint" || true
	exit 1
fi
