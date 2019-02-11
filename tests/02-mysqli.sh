#!/usr/bin/env bash

echo "# --------------------------------------------------------------------------------------------------"
echo "# Testing mysqli connectivity to MySQL"
echo "# --------------------------------------------------------------------------------------------------"

set -e
set -u
set -o pipefail

IMAGE="devilbox/mysql"
TYPE="${1}"
VERSION="${2}"

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

# Start MySQL
docker run \
	-d \
	-it \
	--rm \
	--hostname=mysql \
	--name devilbox-test-mysql \
	-e MYSQL_ALLOW_EMPTY_PASSWORD=yes \
	"${IMAGE}:${TYPE}-${VERSION}"

# Start PHP 7.2
docker run \
	-d \
	-it \
	--rm \
	--hostname=php \
	--entrypoint=bash \
	--name devilbox-test-php \
	--volume="${SCRIPTPATH}:/tmp" \
	--link devilbox-test-mysql php:7.2

# Install PHP mysqli module
docker exec -it devilbox-test-php docker-php-ext-install mysqli

# Test MySQL connectivity
max=100
i=0
while ! docker exec -it devilbox-test-php php /tmp/mysql.php >/dev/null 2>&1; do
	sleep 1
	i=$(( i + 1))
	if [ "${i}" -ge "${max}" ]; then
		docker stop devilbox-test-php   || true
		docker stop devilbox-test-mysql || true
		>&2 echo "Failed"
		exit 1
	fi
done

docker stop devilbox-test-php   || true
docker stop devilbox-test-mysql || true
echo "Success"
