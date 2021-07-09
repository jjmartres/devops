# Devpi docker image

A ready to use Docker image for [devpi](http://doc.devpi.net/latest/). It includes
the following plugins and components:

* devpi-server, devpi-web and devpi-client
* [devpi-semantic-ui](https://github.com/apihackers/devpi-semantic-ui)
* [devpi-ldap](https://pypi.python.org/pypi/devpi-ldap)
* [devpi-findlinks](https://pypi.python.org/pypi/devpi-findlinks)
* [devpi-cleaner](https://pypi.python.org/pypi/devpi-cleaner)
* [devpi-slack](https://pypi.python.org/pypi/devpi-slack)
* [devpi-lockdown](https://pypi.python.org/pypi/devpi-lockdown)

## Build

```bash
docker build -t devpi .
```

## Usage
### starting the image

`devpi` needs its own folder to store packages and data, which you probably want
to map a volume to. Additionally, map TCP port 80.

```bash
docker run -d -p 80:80 -v /some/place:/devpi \
--name devpi-server devpi:latest
```

The first time it runs, the startup script will generate a password for the root
user and store it in `.root_password` in the volume.

If you want to use the LDAP plugin, you need to map the YAML configuration file
into the Docker and tell `devpi-server` to use it:

```bash
docker run -d -p 80:80 -v /some/place:/devpi -v /path/to/ldap.yml:/ldap.yml \
--name devpi-server devpi:latest --ldap-config=/ldap.yml
```

### devpi-client helper
A small helper script is provided to manipulate the running container. The
script will automatically log in as the `root` user for running commands.

```bash
$ docker exec -it devpi-server devpi-client.sh -h
usage: /usr/local/bin/devpi [-h] [--version] [--debug] [-y] [-v]
                            [--clientdir DIR]
                            {quickstart,use,getjson,patchjson,list,remove,user,login,logoff,index,upload,test,push,install,refresh}
...
```

Alternatively, you can start an interactive shell.

```bash
$ docker exec -it devpi-server bash
root@c4fa8a7b14cf:/#
```
### pip

Use a configuration similar to this in your `~/.pip/pip.conf`:

```ini
[global]
index-url = http://localhost/root/pypi/+simple/
```

or

```shell script
export PIP_INDEX_URL=http://localhost/root/pypi/+simple/
export PIP_TRUSTED_HOST=localhost
```

### setuptools

Use a configuration similar to this in your `~/.pydistutils.cfg`:

```ini
[easy_install]
index_url = http://localhost/root/pypi/+simple/
```
