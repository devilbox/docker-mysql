#!/usr/bin/env bash
set -e
set -u
set -o pipefail

IMAGE="devilbox/mysql"
NAME="${1}"
VERSION="${2}"
TAG="${3}"
ARCH="${4}"


if [ "${NAME}" = "mysql" ]; then
	docker run --rm --platform "${ARCH}" "$(tty -s && echo "-it" || echo)" "${IMAGE}:${TAG}" -V | grep 'MySQL' | grep "${VERSION/./\\.}"
elif [ "${NAME}" = "mariadb" ]; then
	docker run --rm --platform "${ARCH}" "$(tty -s && echo "-it" || echo)" "${IMAGE}:${TAG}" -V | grep 'MariaDB' | grep "${VERSION/./\\.}"
elif [ "${NAME}" = "percona" ]; then
	docker run --rm --platform "${ARCH}" "$(tty -s && echo "-it" || echo)" "${IMAGE}:${TAG}" -V | grep 'Percona' | grep "${VERSION/./\\.}"
else
	>&2 echo "[ERROR] Wrong type: ${NAME}"
	exit 1
fi
