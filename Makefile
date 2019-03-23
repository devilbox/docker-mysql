IMAGE = devilbox/mysql
FILES = Dockerfiles/


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
	docker build --no-cache -t $(IMAGE):mysql-5.5 -f $(FILES)/mysql-5.5 $(FILES)
build-mysql-5.6:
	while ! docker pull mysql:5.6; do sleep 1; done
	docker build --no-cache -t $(IMAGE):mysql-5.6 -f $(FILES)/mysql-5.6 $(FILES)
build-mysql-5.7:
	while ! docker pull mysql:5.7; do sleep 1; done
	docker build --no-cache -t $(IMAGE):mysql-5.7 -f $(FILES)/mysql-5.7 $(FILES)
build-mysql-8.0:
	while ! docker pull mysql:8.0; do sleep 1; done
	docker build --no-cache -t $(IMAGE):mysql-8.0 -f $(FILES)/mysql-8.0 $(FILES)

test-mysql-5.5:
	./tests/tests.sh "mysql" "5.5"
test-mysql-5.6:
	./tests/tests.sh "mysql" "5.6"
test-mysql-5.7:
	./tests/tests.sh "mysql" "5.7"
test-mysql-8.0:
	./tests/tests.sh "mysql" "8.0"


# -------------------------------------------------------------------------------------------------
# MARIADB
# -------------------------------------------------------------------------------------------------
build-mariadb-5.5:
	while ! docker pull mariadb:5.5; do sleep 1; done
	docker build --no-cache -t $(IMAGE):mariadb-5.5 -f $(FILES)/mariadb-5.5 $(FILES)
build-mariadb-10.0:
	while ! docker pull mariadb:10.0; do sleep 1; done
	docker build --no-cache -t $(IMAGE):mariadb-10.0 -f $(FILES)/mariadb-10.0 $(FILES)
build-mariadb-10.1:
	while ! docker pull mariadb:10.1; do sleep 1; done
	docker build --no-cache -t $(IMAGE):mariadb-10.1 -f $(FILES)/mariadb-10.1 $(FILES)
build-mariadb-10.2:
	while ! docker pull mariadb:10.2; do sleep 1; done
	docker build --no-cache -t $(IMAGE):mariadb-10.2 -f $(FILES)/mariadb-10.2 $(FILES)
build-mariadb-10.3:
	while ! docker pull mariadb:10.3; do sleep 1; done
	docker build --no-cache -t $(IMAGE):mariadb-10.3 -f $(FILES)/mariadb-10.3 $(FILES)
build-mariadb-10.4:
	while ! docker pull mariadb:10.4; do sleep 1; done
	docker build --no-cache -t $(IMAGE):mariadb-10.4 -f $(FILES)/mariadb-10.4 $(FILES)

test-mariadb-5.5:
	./tests/tests.sh "mariadb" "5.5"
test-mariadb-10.0:
	./tests/tests.sh "mariadb" "10.0"
test-mariadb-10.1:
	./tests/tests.sh "mariadb" "10.1"
test-mariadb-10.2:
	./tests/tests.sh "mariadb" "10.2"
test-mariadb-10.3:
	./tests/tests.sh "mariadb" "10.3"
test-mariadb-10.4:
	./tests/tests.sh "mariadb" "10.4"


# -------------------------------------------------------------------------------------------------
# PERCONA
# -------------------------------------------------------------------------------------------------
build-percona-5.5:
	while ! docker pull percona:5.5; do sleep 1; done
	docker tag percona:5.5 $(IMAGE):percona-5.5
	docker build --no-cache -t $(IMAGE):percona-5.5 -f $(FILES)/percona-5.5 $(FILES)
build-percona-5.6:
	while ! docker pull percona:5.6; do sleep 1; done
	docker build --no-cache -t $(IMAGE):percona-5.6 -f $(FILES)/percona-5.6 $(FILES)
build-percona-5.7:
	while ! docker pull percona:5.7; do sleep 1; done
	docker build --no-cache -t $(IMAGE):percona-5.7 -f $(FILES)/percona-5.7 $(FILES)
build-percona-8.0:
	while ! docker pull percona:8.0; do sleep 1; done
	docker build --no-cache -t $(IMAGE):percona-8.0 -f $(FILES)/percona-8.0 $(FILES)

test-percona-5.5:
	./tests/tests.sh "percona" "5.5"
test-percona-5.6:
	./tests/tests.sh "percona" "5.6"
test-percona-5.7:
	./tests/tests.sh "percona" "5.7"
test-percona-8.0:
	./tests/tests.sh "percona" "8.0"
