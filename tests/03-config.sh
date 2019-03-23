#!/usr/bin/env bash

echo "# --------------------------------------------------------------------------------------------------"
echo "# Testing custom *.cnf files"
echo "# --------------------------------------------------------------------------------------------------"

set -e
set -u
set -o pipefail

IMAGE="devilbox/mysql"
TYPE="${1}"
VERSION="${2}"

# Custom MySQL configuration
CNF_DIR="$( mktemp -d )"
chmod 0755 "${CNF_DIR}"
CNF_KEY="default_time_zone"
CNF_VAL="+03:00"
echo "[mysqld]" > "${CNF_DIR}/timezone.cnf"
echo "${CNF_KEY} = ${CNF_VAL}" >> "${CNF_DIR}/timezone.cnf"


# Start MySQL
docker run \
	-d \
	-it \
	--rm \
	--hostname=mysql \
	--name devilbox-test-mysql \
	-e MYSQL_ALLOW_EMPTY_PASSWORD=yes \
	-v ${CNF_DIR}:/etc/mysql/docker-default.d \
	"${IMAGE}:${TYPE}-${VERSION}"

# Test MySQL connectivity
max=100
i=0
while ! docker exec -it devilbox-test-mysql mysql -uroot --password="" -h 127.0.0.1 -e "SHOW VARIABLES LIKE '%time_zone%';" | grep "${CNF_VAL}"; do
	sleep 1
	i=$(( i + 1))
	if [ "${i}" -ge "${max}" ]; then
		docker stop devilbox-test-mysql || true
		docker kill devilbox-test-mysql || true
		rm -rf "${CNF_DIR}" || true
		>&2 echo "Failed"
		exit 1
	fi
done

docker stop devilbox-test-mysql || true
rm -rf "${CNF_DIR}" || true
echo "Success"
