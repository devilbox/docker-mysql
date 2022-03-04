#!/usr/bin/env bash

set -e
set -u
set -o pipefail

NAME="${1}"
VERSION="${2}"
TAG="${3}"
ARCH="${4}"

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

for f in $( find "${SCRIPTPATH}" -name \*.sh | grep -E '[0-9]+' | sort -u ); do
	echo
	echo "# --------------------------------------------------------------------------------------------------"
	echo "# $( basename "${f}" )"
	echo "# --------------------------------------------------------------------------------------------------"
	if ! ${f} "${NAME}" "${VERSION}" "${TAG}" "${ARCH}"; then
		exit 1
	fi
	echo
done
