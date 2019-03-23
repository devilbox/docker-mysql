#!/usr/bin/env bash
set -e
set -u
set -o pipefail

IMAGE="devilbox/mysql"
TYPE="${1}"
VERSION="${2}"
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"


# Start MySQL
echo "1/5 Starting MySQL"
docker run \
	-d \
	-it \
	--rm \
	--hostname=mysql \
	--name devilbox-test-mysql \
	-e MYSQL_ALLOW_EMPTY_PASSWORD=yes \
	"${IMAGE}:${TYPE}-${VERSION}"

# Pull PHP image
echo "2/5 Pulling PHP image "
while ! docker pull php:7.2; do
	sleep 1
done

# Start PHP 7.2
echo "3/5 Starting PHP"
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
echo "4/5 Installing mysqli extension"
docker exec -it devilbox-test-php docker-php-ext-install mysqli

# Test MySQL connectivity
max=100
i=0
printf "5/5 Testing mysqli extension "
while ! docker exec -it devilbox-test-php php /tmp/mysql.php >/dev/null 2>&1; do
	printf "."
	sleep 1
	i=$(( i + 1))
	if [ "${i}" -ge "${max}" ]; then
		printf "\n"
		>&2 echo "Failed"
		docker exec -it devilbox-test-php php /tmp/mysql.php || true
		docker logs devilbox-test-php   || true
		docker logs devilbox-test-mysql || true
		docker stop devilbox-test-php   || true
		docker stop devilbox-test-mysql || true
		exit 1
	fi
done
printf "\n"

docker stop devilbox-test-php   || true
docker stop devilbox-test-mysql || true
echo "Success"
