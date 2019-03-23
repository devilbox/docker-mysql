#!/usr/bin/env bash

set -e
set -u
set -o pipefail

TYPE="${1}"
VERSION="${2}"
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

for f in $( find "${SCRIPTPATH}" -name \*.sh | grep -E '[0-9]+' | sort -u ); do
	if ! ${f} "${TYPE}" "${VERSION}"; then
		exit 1
	fi
done
