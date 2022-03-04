#!/usr/bin/env bash
set -e
set -u
set -o pipefail

IMAGE="devilbox/mysql"
IMAGE="devilbox/mysql"
#NAME="${1}"
#VERSION="${2}"
TAG="${3}"
ARCH="${4}"


# Custom MySQL configuration
CNF_DIR="$( mktemp -d )"
chmod 0755 "${CNF_DIR}"
CNF_KEY="general_log_file"
CNF_VAL="devilbox.log"
echo "[mysqld]" > "${CNF_DIR}/config.cnf"
echo "${CNF_KEY} = ${CNF_VAL}" >> "${CNF_DIR}/config.cnf"

# Start MySQL
docker run \
	-d \
	--platform "${ARCH}" \
	"$(tty -s && echo "-it" || echo)" \
	--rm \
	--hostname=mysql \
	--name devilbox-test-mysql \
	-e MYSQL_ALLOW_EMPTY_PASSWORD=yes \
	-v "${CNF_DIR}:/etc/mysql/docker-default.d" \
	"${IMAGE}:${TAG}"

# Test MySQL connectivity
max=100
i=0
while ! docker exec "$(tty -s && echo "-it" || echo)" devilbox-test-mysql mysql -uroot --password="" -h 127.0.0.1 -e "SHOW VARIABLES LIKE '%${CNF_KEY}%';" | grep "${CNF_VAL}"; do
	sleep 1
	i=$(( i + 1))
	if [ "${i}" -ge "${max}" ]; then
		docker logs devilbox-test-mysql  2>/dev/null || true
		docker stop devilbox-test-mysql  2>/dev/null || true
		docker kill devilbox-test-mysql  2>/dev/null || true
		docker rm -f devilbox-test-mysql 2>/dev/null || true
		rm -rf "${CNF_DIR}" || true
		>&2 echo "Failed"
		exit 1
	fi
done

docker stop devilbox-test-mysql  2>/dev/null || true
docker kill devilbox-test-mysql  2>/dev/null || true
docker rm -f devilbox-test-mysql 2>/dev/null || true
rm -rf "${CNF_DIR}" || true
echo "Success"
