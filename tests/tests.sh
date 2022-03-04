#!/usr/bin/env bash

set -e
set -u
set -o pipefail

TYPE="${1}"
VERSION="${2}"
ARCH="${3}"
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

for f in $( find "${SCRIPTPATH}" -name \*.sh | grep -E '[0-9]+' | sort -u ); do
	echo "# --------------------------------------------------------------------------------------------------"
	echo "# $( basename "${f}" )"
	echo "# --------------------------------------------------------------------------------------------------"
	if ! ${f} "${TYPE}" "${VERSION}" "${ARCH}"; then
		exit 1
	fi
	echo
done
