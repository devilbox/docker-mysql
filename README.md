# MySQL Docker images


[![lint](https://github.com/devilbox/docker-mysql/workflows/lint/badge.svg)](https://github.com/devilbox/docker-mysql/actions?query=workflow%3Alint)
[![build](https://github.com/devilbox/docker-mysql/workflows/build/badge.svg)](https://github.com/devilbox/docker-mysql/actions?query=workflow%3Abuild)
[![nightly](https://github.com/devilbox/docker-mysql/workflows/nightly/badge.svg)](https://github.com/devilbox/docker-mysql/actions?query=workflow%3Anightly)

[![Tag](https://img.shields.io/github/tag/devilbox/docker-mysql.svg)](https://github.com/devilbox/docker-mysql/releases)
[![Gitter](https://badges.gitter.im/devilbox/Lobby.svg)](https://gitter.im/devilbox/Lobby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![Discourse](https://img.shields.io/discourse/https/devilbox.discourse.group/status.svg?colorB=%234CB697)](https://devilbox.discourse.group)
[![type](https://img.shields.io/badge/type-Docker-blue.svg)](https://hub.docker.com/r/devilbox/mysql)
[![License](https://img.shields.io/badge/license-MIT-%233DA639.svg)](https://opensource.org/licenses/MIT)

The purpose of this project is to simply re-tag the official Docker images for
[MySQL](https://hub.docker.com/_/mysql), [MariaDB](https://hub.docker.com/_/mariadb) and
[Percona](https://hub.docker.com/_/percona) in order to use them for the
**[Devilbox](https://github.com/cytopia/devilbox)** project.

| Docker Hub | Upstream Project |
|------------|------------------|
| <a href="https://hub.docker.com/r/devilbox/mysql"><img height="82px" src="http://dockeri.co/image/devilbox/mysql" /></a> | <a href="https://github.com/cytopia/devilbox" ><img height="82px" src="https://raw.githubusercontent.com/devilbox/artwork/master/submissions_banner/cytopia/01/png/banner_256_trans.png" /></a> |


## Documentation

In case you seek help, go and visit the community pages.

<table width="100%" style="width:100%; display:table;">
 <thead>
  <tr>
   <th width="33%" style="width:33%;"><h3><a target="_blank" href="https://devilbox.readthedocs.io">Documentation</a></h3></th>
   <th width="33%" style="width:33%;"><h3><a target="_blank" href="https://gitter.im/devilbox/Lobby">Chat</a></h3></th>
   <th width="33%" style="width:33%;"><h3><a target="_blank" href="https://devilbox.discourse.group">Forum</a></h3></th>
  </tr>
 </thead>
 <tbody style="vertical-align: middle; text-align: center;">
  <tr>
   <td>
    <a target="_blank" href="https://devilbox.readthedocs.io">
     <img title="Documentation" name="Documentation" src="https://raw.githubusercontent.com/cytopia/icons/master/400x400/readthedocs.png" />
    </a>
   </td>
   <td>
    <a target="_blank" href="https://gitter.im/devilbox/Lobby">
     <img title="Chat on Gitter" name="Chat on Gitter" src="https://raw.githubusercontent.com/cytopia/icons/master/400x400/gitter.png" />
    </a>
   </td>
   <td>
    <a target="_blank" href="https://devilbox.discourse.group">
     <img title="Devilbox Forums" name="Forum" src="https://raw.githubusercontent.com/cytopia/icons/master/400x400/discourse.png" />
    </a>
   </td>
  </tr>
  <tr>
  <td><a target="_blank" href="https://devilbox.readthedocs.io">devilbox.readthedocs.io</a></td>
  <td><a target="_blank" href="https://gitter.im/devilbox/Lobby">gitter.im/devilbox</a></td>
  <td><a target="_blank" href="https://devilbox.discourse.group">devilbox.discourse.group</a></td>
  </tr>
 </tbody>
</table>


## Additional features

The provided images are purely based on their official counterparts, however they have also been
slightly customized/enhanced additions added:

* An additional \*.cnf config directory is provided: `/etc/mysql/docker-default.d/`. This is necessary as the default config directory already contains \*.cnf files and you might want to keep them and still be able to additionally provide custom files
* MySQL 8.0 and Percona 8.0 by default use a new authentication mechanism which is not (yet) understood by PHP's mysqli module. For those two images, the old authentication type has been re-enabled, so you can still use it with your current PHP code.


## Defaults

### Docker Image

| What       | Value                       |
|------------|-----------------------------|
| ENTRYPOINT | `["/docker-entrypoint.sh"]` |
| CMD        | `["mysqld"]`                |

### Mountpoints

| Path                           | Description                            |
|--------------------------------|----------------------------------------|
| `/etc/mysql/conf.d`            | Default primary config mountpoint      |
| `/etc/mysql/docker-default.d/` | Additional secondary config mountpoint |


## Docker Tags

For retagged information see below.

#### MySQL

* [DockerHub](https://hub.docker.com/_/mysql)
* [GitHub](https://github.com/docker-library/mysql)

| Original Image and Tag | New Image and Tag             |
|------------------------|-------------------------------|
| `mysql:5.5`            | `devilbox/mysql:mysql-5.5`    |
| `mysql:5.6`            | `devilbox/mysql:mysql-5.6`    |
| `mysql:5.7`            | `devilbox/mysql:mysql-5.7`    |
| `mysql:8.0`            | `devilbox/mysql:mysql-8.0`    |

#### MariaDB

* [DockerHub](https://hub.docker.com/_/mariadb)
* [GitHub](https://github.com/docker-library/mariadb)

| Original Image and Tag | New Image and Tag             |
|------------------------|-------------------------------|
| `mariadb:5.5`          | `devilbox/mysql:mariadb-5.5`  |
| `mariadb:10.0`         | `devilbox/mysql:mariadb-10.0` |
| `mariadb:10.1`         | `devilbox/mysql:mariadb-10.1` |
| `mariadb:10.2`         | `devilbox/mysql:mariadb-10.2` |
| `mariadb:10.3`         | `devilbox/mysql:mariadb-10.3` |
| `mariadb:10.4`         | `devilbox/mysql:mariadb-10.4` |
| `mariadb:10.5`         | `devilbox/mysql:mariadb-10.5` |

#### Percona

* [DockerHub](https://hub.docker.com/_/percona)
* [GitHub](https://github.com/docker-library/percona)

| Original Image and Tag | New Image and Tag             |
|------------------------|-------------------------------|
| `percona:5.5`          | `devilbox/mysql:percona-5.5`  |
| `percona:5.6`          | `devilbox/mysql:percona-5.6`  |
| `percona:5.7`          | `devilbox/mysql:percona-5.7`  |
| `percona:8.0`          | `devilbox/mysql:percona-8.0`  |


## License

**[MIT License](LICENSE)**

Copyright (c) 2019 [cytopia](https://github.com/cytopia)
