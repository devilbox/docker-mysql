# MySQL Docker images

[![Tag](https://img.shields.io/github/tag/devilbox/docker-mysql.svg)](https://github.com/devilbox/docker-mysql/releases)
[![](https://img.shields.io/badge/github-devilbox%2Fdocker--mysql-red.svg)](https://github.com/devilbox/docker-mysql "github.com/devilbox/docker-mysql")
[![lint](https://github.com/devilbox/docker-mysql/workflows/lint/badge.svg)](https://github.com/devilbox/docker-mysql/actions?query=workflow%3Alint)
[![build](https://github.com/devilbox/docker-mysql/workflows/build/badge.svg)](https://github.com/devilbox/docker-mysql/actions?query=workflow%3Abuild)
[![nightly](https://github.com/devilbox/docker-mysql/workflows/nightly/badge.svg)](https://github.com/devilbox/docker-mysql/actions?query=workflow%3Anightly)
[![License](https://img.shields.io/badge/license-MIT-%233DA639.svg)](https://opensource.org/licenses/MIT)

[![Discord](https://img.shields.io/discord/1051541389256704091?color=8c9eff&label=Discord&logo=discord)](https://discord.gg/2wP3V6kBj4)
[![Discourse](https://img.shields.io/discourse/https/devilbox.discourse.group/status.svg?colorB=%234CB697&label=Discourse&logo=discourse)](https://devilbox.discourse.group)

**Available Architectures:**  `amd64`, `arm64`

[![](https://img.shields.io/docker/pulls/devilbox/mysql.svg)](https://hub.docker.com/r/devilbox/mysql)

The purpose of this project is to streamline and re-tag the official Docker images for
[MySQL](https://hub.docker.com/_/mysql), [MariaDB](https://hub.docker.com/_/mariadb) and
[Percona](https://hub.docker.com/_/percona) in order to use them for the
**[Devilbox](https://github.com/cytopia/devilbox)** project.

> ##### 🐱 GitHub: [devilbox/docker-mysql](https://github.com/devilbox/docker-mysql)

| Current Project  | Reference Implementation |
|:----------------:|:------------------------:|
| <a title="Docker MySQL" href="https://github.com/devilbox/docker-mysql" ><img height="82px" src="https://raw.githubusercontent.com/devilbox/artwork/master/submissions_banner/cytopia/04/png/banner_256_trans.png" /></a> | <a title="Devilbox" href="https://github.com/cytopia/devilbox" ><img height="82px" src="https://raw.githubusercontent.com/devilbox/artwork/master/submissions_banner/cytopia/01/png/banner_256_trans.png" /></a> |
| Streamlined [MySQL](https://github.com/devilbox/docker-mysql) images | The [Devilbox](https://github.com/cytopia/devilbox) |



## 🐋 Available Docker tags

[![](https://img.shields.io/docker/pulls/devilbox/mysql.svg)](https://hub.docker.com/r/devilbox/mysql)

[`mysql-5.5`][tag_mysql-5.5]
[`mysql-5.6`][tag_mysql-5.6]
[`mysql-5.7`][tag_mysql-5.7]
[`mysql-8.0`][tag_mysql-8.0]

[`mariadb-5.5`][tag_mariadb-5.5]
[`mariadb-10.0`][tag_mariadb-10.0]
[`mariadb-10.1`][tag_mariadb-10.1]
[`mariadb-10.2`][tag_mariadb-10.2]
[`mariadb-10.3`][tag_mariadb-10.3]
[`mariadb-10.4`][tag_mariadb-10.4]
[`mariadb-10.5`][tag_mariadb-10.5]
[`mariadb-10.6`][tag_mariadb-10.6]
[`mariadb-10.7`][tag_mariadb-10.7]
[`mariadb-10.8`][tag_mariadb-10.8]
[`mariadb-10.9`][tag_mariadb-10.9]
[`mariadb-10.10`][tag_mariadb-10.10]

[`percona-5.5`][tag_percona-5.5]
[`percona-5.6`][tag_percona-5.6]
[`percona-5.7`][tag_percona-5.7]
[`percona-8.0`][tag_percona-8.0]


[tag_mysql-5.5]: https://github.com/devilbox/docker-mysql/blob/master/Dockerfiles/mysql-5.5
[tag_mysql-5.6]: https://github.com/devilbox/docker-mysql/blob/master/Dockerfiles/mysql-5.6
[tag_mysql-5.7]: https://github.com/devilbox/docker-mysql/blob/master/Dockerfiles/mysql-5.7
[tag_mysql-8.0]: https://github.com/devilbox/docker-mysql/blob/master/Dockerfiles/mysql-8.0

[tag_percona-5.5]: https://github.com/devilbox/docker-mysql/blob/master/Dockerfiles/percona-5.5
[tag_percona-5.6]: https://github.com/devilbox/docker-mysql/blob/master/Dockerfiles/percona-5.6
[tag_percona-5.7]: https://github.com/devilbox/docker-mysql/blob/master/Dockerfiles/percona-5.7
[tag_percona-8.0]: https://github.com/devilbox/docker-mysql/blob/master/Dockerfiles/percona-8.0

[tag_mariadb-5.5]: https://github.com/devilbox/docker-mysql/blob/master/Dockerfiles/mariadb-5.5
[tag_mariadb-10.0]: https://github.com/devilbox/docker-mysql/blob/master/Dockerfiles/mariadb-10.0
[tag_mariadb-10.1]: https://github.com/devilbox/docker-mysql/blob/master/Dockerfiles/mariadb-10.1
[tag_mariadb-10.2]: https://github.com/devilbox/docker-mysql/blob/master/Dockerfiles/mariadb-10.2
[tag_mariadb-10.3]: https://github.com/devilbox/docker-mysql/blob/master/Dockerfiles/mariadb-10.3
[tag_mariadb-10.4]: https://github.com/devilbox/docker-mysql/blob/master/Dockerfiles/mariadb-10.4
[tag_mariadb-10.5]: https://github.com/devilbox/docker-mysql/blob/master/Dockerfiles/mariadb-10.5
[tag_mariadb-10.6]: https://github.com/devilbox/docker-mysql/blob/master/Dockerfiles/mariadb-10.6
[tag_mariadb-10.7]: https://github.com/devilbox/docker-mysql/blob/master/Dockerfiles/mariadb-10.7
[tag_mariadb-10.8]: https://github.com/devilbox/docker-mysql/blob/master/Dockerfiles/mariadb-10.8
[tag_mariadb-10.9]: https://github.com/devilbox/docker-mysql/blob/master/Dockerfiles/mariadb-10.9
[tag_mariadb-10.10]: https://github.com/devilbox/docker-mysql/blob/master/Dockerfiles/mariadb-10.10

```bash
docker pull devilbox/mysql:<docker-tag>
```


## ✰ Additional features

The provided images are purely based on their official counterparts, however they have also been
slightly customized/enhanced additions added:

* An additional \*.cnf config directory is provided: `/etc/mysql/docker-default.d/`. This is necessary as the default config directory already contains \*.cnf files and you might want to keep them and still be able to additionally provide custom files
* MySQL 8.0 and Percona 8.0 by default use a new authentication mechanism which is not (yet) understood by PHP's `mysqli` extension. For those two images, the old authentication mechanism **[`mysql_native_password`](https://dev.mysql.com/doc/refman/8.0/en/native-pluggable-authentication.html)**  has been re-enabled, so you can still use it with your current PHP code.


## ∑ Environment Variables

Same as official Docker images:

* [MySQL](https://hub.docker.com/_/mysql)
* [MariaDB](https://hub.docker.com/_/mariadb)
* [Percona](https://hub.docker.com/_/percona)


## 🖧 Exposed Ports

MySQL listening port `3306`


## 📂 Volumes

The mountpoints for configuration files have been streamlined for all images in this repository.

| Path                           | Description                            |
|--------------------------------|----------------------------------------|
| `/etc/mysql/conf.d`            | Default primary config mountpoint      |
| `/etc/mysql/docker-default.d/` | Additional secondary config mountpoint |


## ∢ Build

Build MySQL 5.5 Docker image locally
```bash
make build NAME=mysql VERSION=5.5
```
Build MariaDB 10.10 Docker image for `arm64` locally
```bash
make build NAME=mariadb VERSION=10.10 ARCH=linux/arm64
```


## 🛈 Retagging of official images

The below listed tables show how the official images have been retagged.

#### MySQL

* [DockerHub](https://hub.docker.com/_/mysql)
* [GitHub](https://github.com/docker-library/mysql)

| Original Image and Tag | New Image and Tag              | Available platforms |
|------------------------|--------------------------------|---------------------|
| `mysql:5.5`            | `devilbox/mysql:mysql-5.5`     | `amd64`             |
| `mysql:5.6`            | `devilbox/mysql:mysql-5.6`     | `amd64`             |
| `mysql:5.7`            | `devilbox/mysql:mysql-5.7`     | `amd64`             |
| `mysql:8.0`            | `devilbox/mysql:mysql-8.0`     | `amd64`, `arm64`    |

#### MariaDB

* [DockerHub](https://hub.docker.com/_/mariadb)
* [GitHub](https://github.com/docker-library/mariadb)

| Original Image and Tag | New Image and Tag              | Available platforms |
|------------------------|--------------------------------|---------------------|
| `mariadb:5.5`          | `devilbox/mysql:mariadb-5.5`   | `amd64`             |
| `mariadb:10.0`         | `devilbox/mysql:mariadb-10.0`  | `amd64`             |
| `mariadb:10.1`         | `devilbox/mysql:mariadb-10.1`  | `amd64`, `arm64`    |
| `mariadb:10.2`         | `devilbox/mysql:mariadb-10.2`  | `amd64`, `arm64`    |
| `mariadb:10.3`         | `devilbox/mysql:mariadb-10.3`  | `amd64`, `arm64`    |
| `mariadb:10.4`         | `devilbox/mysql:mariadb-10.4`  | `amd64`, `arm64`    |
| `mariadb:10.5`         | `devilbox/mysql:mariadb-10.5`  | `amd64`, `arm64`    |
| `mariadb:10.6`         | `devilbox/mysql:mariadb-10.6`  | `amd64`, `arm64`    |
| `mariadb:10.7`         | `devilbox/mysql:mariadb-10.7`  | `amd64`, `arm64`    |
| `mariadb:10.8`         | `devilbox/mysql:mariadb-10.8`  | `amd64`, `arm64`    |
| `mariadb:10.9`         | `devilbox/mysql:mariadb-10.9`  | `amd64`, `arm64`    |
| `mariadb:10.10`        | `devilbox/mysql:mariadb-10.10` | `amd64`, `arm64`    |

#### Percona

* [DockerHub](https://hub.docker.com/_/percona)
* [GitHub](https://github.com/docker-library/percona)

| Original Image and Tag | New Image and Tag              | Available platforms |
|------------------------|--------------------------------|---------------------|
| `percona:5.5`          | `devilbox/mysql:percona-5.5`   | `amd64`             |
| `percona:5.6`          | `devilbox/mysql:percona-5.6`   | `amd64`             |
| `percona:5.7`          | `devilbox/mysql:percona-5.7`   | `amd64`             |
| `percona:8.0`          | `devilbox/mysql:percona-8.0`   | `amd64`             |


## 🖤 Sister Projects

Show some love for the following sister projects.

<table>
 <tr>
  <th>🖤 Project</th>
  <th>🐱 GitHub</th>
  <th>🐋 DockerHub</th>
 </tr>
 <tr>
  <td><a title="Devilbox" href="https://github.com/cytopia/devilbox" ><img width="256px" src="https://raw.githubusercontent.com/devilbox/artwork/master/submissions_banner/cytopia/01/png/banner_256_trans.png" /></a></td>
  <td><a href="https://github.com/cytopia/devilbox"><code>Devilbox</code></a></td>
  <td></td>
 </tr>
 <tr>
  <td><a title="Docker PHP-FMP" href="https://github.com/devilbox/docker-php-fpm" ><img width="256px" src="https://raw.githubusercontent.com/devilbox/artwork/master/submissions_banner/cytopia/02/png/banner_256_trans.png" /></a></td>
  <td><a href="https://github.com/devilbox/docker-php-fpm"><code>docker-php-fpm</code></a></td>
  <td><a href="https://hub.docker.com/r/devilbox/php-fpm"><code>devilbox/php-fpm</code></a></td>
 </tr>
 <tr>
  <td><a title="Docker PHP-FMP-Community" href="https://github.com/devilbox/docker-php-fpm-community" ><img width="256px" src="https://raw.githubusercontent.com/devilbox/artwork/master/submissions_banner/cytopia/03/png/banner_256_trans.png" /></a></td>
  <td><a href="https://github.com/devilbox/docker-php-fpm-community"><code>docker-php-fpm-community</code></a></td>
  <td><a href="https://hub.docker.com/r/devilbox/php-fpm-community"><code>devilbox/php-fpm-community</code></a></td>
 </tr>
 <tr>
  <td><a title="Docker MySQL" href="https://github.com/devilbox/docker-mysql" ><img width="256px" src="https://raw.githubusercontent.com/devilbox/artwork/master/submissions_banner/cytopia/04/png/banner_256_trans.png" /></a></td>
  <td><a href="https://github.com/devilbox/docker-mysql"><code>docker-mysql</code></a></td>
  <td><a href="https://hub.docker.com/r/devilbox/mysql"><code>devilbox/mysql</code></a></td>
 </tr>
 <tr>
  <td><img width="256px" src="https://raw.githubusercontent.com/devilbox/artwork/master/submissions_banner/cytopia/05/png/banner_256_trans.png" /></td>
  <td>
   <a href="https://github.com/devilbox/docker-apache-2.2"><code>docker-apache-2.2</code></a><br/>
   <a href="https://github.com/devilbox/docker-apache-2.4"><code>docker-apache-2.4</code></a><br/>
   <a href="https://github.com/devilbox/docker-nginx-stable"><code>docker-nginx-stable</code></a><br/>
   <a href="https://github.com/devilbox/docker-nginx-mainline"><code>docker-nginx-mainline</code></a>
  </td>
  <td>
   <a href="https://hub.docker.com/r/devilbox/apache-2.2"><code>devilbox/apache-2.2</code></a><br/>
   <a href="https://hub.docker.com/r/devilbox/apache-2.4"><code>devilbox/apache-2.4</code></a><br/>
   <a href="https://hub.docker.com/r/devilbox/nginx-stable"><code>devilbox/nginx-stable</code></a><br/>
   <a href="https://hub.docker.com/r/devilbox/nginx-mainline"><code>devilbox/nginx-mainline</code></a>
  </td>
 </tr>
</table>


## 👫 Community

In case you seek help, go and visit the community pages.

<table width="100%" style="width:100%; display:table;">
 <thead>
  <tr>
   <th width="33%" style="width:33%;"><h3><a target="_blank" href="https://devilbox.readthedocs.io">📘	Documentation</a></h3></th>
   <th width="33%" style="width:33%;"><h3><a target="_blank" href="https://discord.gg/2wP3V6kBj4">🎮 Discord</a></h3></th>
   <th width="33%" style="width:33%;"><h3><a target="_blank" href="https://devilbox.discourse.group">🗪 Forum</a></h3></th>
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
    <a target="_blank" href="https://discord.gg/2wP3V6kBj4">
     <img title="Chat on Discord" name="Chat on Discord" src="https://raw.githubusercontent.com/cytopia/icons/master/400x400/discord.png" />
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
  <td><a target="_blank" href="https://discord.gg/2wP3V6kBj4">discord/devilbox</a></td>
  <td><a target="_blank" href="https://devilbox.discourse.group">devilbox.discourse.group</a></td>
  </tr>
 </tbody>
</table>


## 🧘 Maintainer

**[@cytopia](https://github.com/cytopia)**

I try to keep up with literally **over 100 projects** besides a full-time job.
If my work is making your life easier, consider contributing. 🖤

* [GitHub Sponsorship](https://github.com/sponsors/cytopia)
* [Patreon](https://www.patreon.com/devilbox)
* [Open Collective](https://opencollective.com/devilbox)

**Findme:**
**🐱** [cytopia](https://github.com/cytopia) / [devilbox](https://github.com/devilbox) |
**🐋** [cytopia](https://hub.docker.com/r/cytopia/) / [devilbox](https://hub.docker.com/r/devilbox/) |
**🐦** [everythingcli](https://twitter.com/everythingcli) / [devilbox](https://twitter.com/devilbox) |
**📖** [everythingcli.org](http://www.everythingcli.org/)

**Contrib:** PyPI: [cytopia](https://pypi.org/user/cytopia/) **·**
Terraform: [cytopia](https://registry.terraform.io/namespaces/cytopia) **·**
Ansible: [cytopia](https://galaxy.ansible.com/cytopia)


## 🗎 License

**[MIT License](LICENSE)**

Copyright (c) 2019 [cytopia](https://github.com/cytopia)
