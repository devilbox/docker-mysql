IMAGE = devilbox/mysql


# -------------------------------------------------------------------------------------------------
# CONVENIENCE TARGETS
# -------------------------------------------------------------------------------------------------

build: build-mysql-5.5 build-mysql-5.6 build-mysql-5.7 build-mysql-8.0 build-mariadb-5.5 build-mariadb-10.0 build-mariadb-10.1 build-mariadb-10.2 build-mariadb-10.3 build-mariadb-10.4 build-percona-5.5 build-percona-5.6 build-percona-5.7 build-percona-8.0

test: test-mysql-5.5 test-mysql-5.6 test-mysql-5.7 test-mysql-8.0 test-mariadb-5.5 test-mariadb-10.0 test-mariadb-10.1 test-mariadb-10.2 test-mariadb-10.3 test-mariadb-10.4 test-percona-5.5 test-percona-5.6 test-percona-5.7 test-percona-8.0

login:
	yes | docker login --username $(USER) --password $(PASS)


# -------------------------------------------------------------------------------------------------
# MYSQL
# -------------------------------------------------------------------------------------------------
build-mysql-5.5:
	while ! docker pull mysql:5.5; do sleep 1; done
	docker tag mysql:5.5 $(IMAGE):mysql-5.5
build-mysql-5.6:
	while ! docker pull mysql:5.6; do sleep 1; done
	docker tag mysql:5.6 $(IMAGE):mysql-5.6
build-mysql-5.7:
	while ! docker pull mysql:5.7; do sleep 1; done
	docker tag mysql:5.7 $(IMAGE):mysql-5.7
build-mysql-8.0:
	while ! docker pull mysql:8.0; do sleep 1; done
	# Adjust and commit authentication
	docker run -it -d --rm -e MYSQL_ALLOW_EMPTY_PASSWORD=yes --name devilbox-mysql-commit mysql:8.0
	docker exec -it devilbox-mysql-commit \
		sed -i'' "s/^symbolic-links.*$$/symbolic-links=0\ndefault-authentication-plugin=mysql_native_password/g" /etc/mysql/my.cnf
	docker diff devilbox-mysql-commit
	docker commit devilbox-mysql-commit mysql:8.0
	docker stop devilbox-mysql-commit
	# /Adjust and commit authentication
	docker tag mysql:8.0 $(IMAGE):mysql-8.0

test-mysql-5.5:
	docker run --rm -it $(IMAGE):mysql-5.5 -V | grep 'MySQL' | grep '5\.5'
test-mysql-5.6:
	docker run --rm -it $(IMAGE):mysql-5.6 -V | grep 'MySQL' | grep '5\.6'
test-mysql-5.7:
	docker run --rm -it $(IMAGE):mysql-5.7 -V | grep 'MySQL' | grep '5\.7'
test-mysql-8.0:
	docker run --rm -it $(IMAGE):mysql-8.0 -V | grep 'MySQL' | grep '8\.0'


# -------------------------------------------------------------------------------------------------
# MARIADB
# -------------------------------------------------------------------------------------------------
build-mariadb-5.5:
	while ! docker pull mariadb:5.5; do sleep 1; done
	docker tag mariadb:5.5 $(IMAGE):mariadb-5.5
build-mariadb-10.0:
	while ! docker pull mariadb:10.0; do sleep 1; done
	docker tag mariadb:10.0 $(IMAGE):mariadb-10.0
build-mariadb-10.1:
	while ! docker pull mariadb:10.1; do sleep 1; done
	docker tag mariadb:10.1 $(IMAGE):mariadb-10.1
build-mariadb-10.2:
	while ! docker pull mariadb:10.2; do sleep 1; done
	docker tag mariadb:10.2 $(IMAGE):mariadb-10.2
build-mariadb-10.3:
	while ! docker pull mariadb:10.3; do sleep 1; done
	docker tag mariadb:10.3 $(IMAGE):mariadb-10.3
build-mariadb-10.4:
	while ! docker pull mariadb:10.4; do sleep 1; done
	docker tag mariadb:10.4 $(IMAGE):mariadb-10.4

test-mariadb-5.5:
	docker run --rm -it $(IMAGE):mariadb-5.5 -V | grep 'MariaDB' | grep '5\.5'
test-mariadb-10.0:
	docker run --rm -it $(IMAGE):mariadb-10.0 -V | grep 'MariaDB' | grep '10\.0'
test-mariadb-10.1:
	docker run --rm -it $(IMAGE):mariadb-10.1 -V | grep 'MariaDB' | grep '10\.1'
test-mariadb-10.2:
	docker run --rm -it $(IMAGE):mariadb-10.2 -V | grep 'MariaDB' | grep '10\.2'
test-mariadb-10.3:
	docker run --rm -it $(IMAGE):mariadb-10.3 -V | grep 'MariaDB' | grep '10\.3'
test-mariadb-10.4:
	docker run --rm -it $(IMAGE):mariadb-10.4 -V | grep 'MariaDB' | grep '10\.4'


# -------------------------------------------------------------------------------------------------
# PERCONA
# -------------------------------------------------------------------------------------------------
build-percona-5.5:
	while ! docker pull percona:5.5; do sleep 1; done
	docker tag percona:5.5 $(IMAGE):percona-5.5
build-percona-5.6:
	while ! docker pull percona:5.6; do sleep 1; done
	docker tag percona:5.6 $(IMAGE):percona-5.6
build-percona-5.7:
	while ! docker pull percona:5.7; do sleep 1; done
	docker tag percona:5.7 $(IMAGE):percona-5.7
build-percona-8.0:
	while ! docker pull percona:8.0; do sleep 1; done
	# Adjust and commit authentication
	docker run -it -d --rm -e MYSQL_ALLOW_EMPTY_PASSWORD=yes --name devilbox-mysql-commit percona:8.0
	docker exec -it --user root devilbox-mysql-commit \
		sed -i'' "s|^pid-file=.*$$|pid-file=/var/run/mysqld/mysqld.pid\ndefault-authentication-plugin=mysql_native_password|g" /etc/my.cnf
	#docker exec -it --user root devilbox-mysql-commit rm -rf /var/log/mysql
	docker diff devilbox-mysql-commit
	docker commit devilbox-mysql-commit percona:8.0
	docker stop devilbox-mysql-commit
	# /Adjust and commit authentication
	docker tag percona:8.0 $(IMAGE):percona-8.0

test-percona-5.5:
	docker run --rm -it $(IMAGE):percona-5.5 -V | grep 'Percona' | grep '5\.5'
test-percona-5.6:
	docker run --rm -it $(IMAGE):percona-5.6 -V | grep 'Percona' | grep '5\.6'
test-percona-5.7:
	docker run --rm -it $(IMAGE):percona-5.7 -V | grep 'Percona' | grep '5\.7'
test-percona-8.0:
	docker run --rm -it $(IMAGE):percona-8.0 -V | grep 'Percona' | grep '8\.0'
