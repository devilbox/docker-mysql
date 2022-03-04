#!/usr/bin/env bash
set -e
set -u
set -o pipefail

IMAGE="devilbox/mysql"
#NAME="${1}"
#VERSION="${2}"
TAG="${3}"
ARCH="${4}"
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"


# Start MySQL
echo "1/5 Starting MySQL"
docker run \
	-d \
	--platform "${ARCH}" \
	"$(tty -s && echo "-it" || echo)" \
	--rm \
	--hostname=mysql \
	--name devilbox-test-mysql \
	-e MYSQL_ALLOW_EMPTY_PASSWORD=yes \
	"${IMAGE}:${TAG}"

# Pull PHP image
echo "2/5 Pulling PHP image "
while ! docker pull php:7.2; do
	sleep 1
done

# Start PHP 7.2
echo "3/5 Starting PHP"
docker run \
	-d \
	--platform "${ARCH}" \
	"$(tty -s && echo "-it" || echo)" \
	--rm \
	--hostname=php \
	--name devilbox-test-php \
	--volume="${SCRIPTPATH}:/tmp" \
	--link devilbox-test-mysql php:7.2 sh -c 'sleep 9000'

# Install PHP mysqli module
echo "4/5 Installing mysqli extension"
if ! docker exec "$(tty -s && echo "-it" || echo)" devilbox-test-php sh -c 'docker-php-ext-install mysqli'; then
	docker logs devilbox-test-php    2>/dev/null || true
	docker logs devilbox-test-mysql  2>/dev/null || true
	docker stop devilbox-test-php    2>/dev/null || true
	docker stop devilbox-test-mysql  2>/dev/null || true
	docker kill devilbox-test-php    2>/dev/null || true
	docker kill devilbox-test-mysql  2>/dev/null || true
	docker rm -f devilbox-test-php   2>/dev/null || true
	docker rm -f devilbox-test-mysql 2>/dev/null || true
	exit 1
fi

# Test MySQL connectivity
max=100
i=0
printf "5/5 Testing mysqli extension "
while ! docker exec "$(tty -s && echo "-it" || echo)" devilbox-test-php php /tmp/mysql.php >/dev/null 2>&1; do
	printf "."
	sleep 1
	i=$(( i + 1))
	if [ "${i}" -ge "${max}" ]; then
		printf "\\n"
		>&2 echo "Failed"
		docker exec "$(tty -s && echo "-it" || echo)" devilbox-test-php php /tmp/mysql.php || true
		docker logs devilbox-test-php    2>/dev/null || true
		docker logs devilbox-test-mysql  2>/dev/null || true
		docker stop devilbox-test-php    2>/dev/null || true
		docker stop devilbox-test-mysql  2>/dev/null || true
		docker kill devilbox-test-php    2>/dev/null || true
		docker kill devilbox-test-mysql  2>/dev/null || true
		docker rm -f devilbox-test-php   2>/dev/null || true
		docker rm -f devilbox-test-mysql 2>/dev/null || true
		exit 1
	fi
done
printf "\\n"

docker stop devilbox-test-php    2>/dev/null || true
docker stop devilbox-test-mysql  2>/dev/null || true
docker kill devilbox-test-php    2>/dev/null || true
docker kill devilbox-test-mysql  2>/dev/null || true
docker rm -f devilbox-test-php   2>/dev/null || true
docker rm -f devilbox-test-mysql 2>/dev/null || true
echo "Success"
