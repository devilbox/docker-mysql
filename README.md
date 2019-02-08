# MySQL Docker images

[![Build Status](https://travis-ci.org/devilbox/docker-mysql.svg?branch=master)](https://travis-ci.org/devilbox/docker-mysql)
[![Gitter](https://badges.gitter.im/devilbox/Lobby.svg)](https://gitter.im/devilbox/Lobby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![Discourse](https://img.shields.io/discourse/https/devilbox.discourse.group/status.svg?colorB=%234CB697)](https://devilbox.discourse.group)
[![type](https://img.shields.io/badge/type-Docker-blue.svg)](https://www.docker.com/)
[![License](https://img.shields.io/badge/license-MIT-%233DA639.svg)](https://opensource.org/licenses/MIT)

The purpose of this project is to simply re-tag the official Docker images for MySQL, MariaDB and
Percona in order to use them for the **[Devilbox](https://github.com/cytopia/devilbox)** project.


| Docker Hub | Upstream Project |
|------------|------------------|
| <a href="https://hub.docker.com/r/devilbox/mysql"><img height="82px" src="http://dockeri.co/image/devilbox/mysql" /></a> | <a href="https://github.com/cytopia/devilbox" ><img height="82px" src="https://raw.githubusercontent.com/devilbox/artwork/master/submissions_banner/cytopia/01/png/banner_256_trans.png" /></a> |


## Docker Tags

#### [MySQL](https://hub.docker.com/_/mysql)

| Original Image and Tag | New Image and Tag             |
|------------------------|-------------------------------|
| `mysql:5.5`            | `devilbox/mysql:mysql-5.5`    |
| `mysql:5.6`            | `devilbox/mysql:mysql-5.6`    |
| `mysql:5.7`            | `devilbox/mysql:mysql-5.7`    |
| `mysql:8.0`            | `devilbox/mysql:mysql-8.0`    |

#### [MariaDB](https://hub.docker.com/_/mariadb)

| Original Image and Tag | New Image and Tag             |
|------------------------|-------------------------------|
| `mariadb:5.5`          | `devilbox/mysql:mariadb-5.5`  |
| `mariadb:10.0`         | `devilbox/mysql:mariadb-10.0` |
| `mariadb:10.1`         | `devilbox/mysql:mariadb-10.1` |
| `mariadb:10.2`         | `devilbox/mysql:mariadb-10.2` |
| `mariadb:10.3`         | `devilbox/mysql:mariadb-10.3` |
| `mariadb:10.4`         | `devilbox/mysql:mariadb-10.4` |

#### [Percona](https://hub.docker.com/_/percona)

| Original Image and Tag | New Image and Tag             |
|------------------------|-------------------------------|
| `percona:5.5`          | `devilbox/mysql:percona-5.5`  |
| `percona:5.6`          | `devilbox/mysql:percona-5.6`  |
| `percona:5.7`          | `devilbox/mysql:percona-5.7`  |
| `percona:8.0`          | `devilbox/mysql:percona-5.5`  |
