# d-mediawiki

This directory contains a Dockerfile that adds a slight tweak 
to the official MediaWiki docker container. Before launching
the container, it specifies `/var/www/html` as a mounted volume, 
and it copies `LocalSettings.php`, the MediaWiki config file, 
from this repo into the container.

Use the run script to run the docker container.
The run script expects the MySQL container to be
called `stormy_mysql` and for MySQL to be listening
on the standard MySQL port, 3306.

See [d-mysql repo](https://charlesreid1.com:3000/docker/d-mysql).

## Docker Compose

To use this container as part of a pod for the charlesreid1.com wiki, see [pod-charlesreid1-wiki](https://charlesreid1.com:3000/docker/pod-charlesreid1-wiki).

To use the container standalone, keep reading.

## Make Tasks

Quick start:

```
make
```

This will run the build and run tasks.

There are a few make tasks:
* `build` task - build the MediaWiki docker container
* `run` task - run the MW docker container
* `disk` - make a docker volume for the MW container
* `rm_disk` - remove the docker volume for the MW container
* `clean` - stop the currently running mysql container
* `cleanreally` - stop the container and dele the data volume

To stop a running container:

```
make clean
```

To stop a running container and delete the data volume:

```
make cleanreally
```

To remove the data volume:

```
make rm_disk
```

To create the data volume:

```
make disk
```

To re-build the container:

```
make build
```

To run the container:

```
make run
```

## Updating Settings

To update LocalSettings.php, skins, or extensions,
you will need to re-make the Docker container.
Use the make rules to remake the Docker container:

```
make clean
make build
make run
```

## Submodule

To clone the repo with the submodule:

```
git clone --recursive https://charlesreid1.com:3000/docker/d-mediawiki.git
```

To check out the submodule after a shallow clone:

```
git submodule init
# or 
git submodule update --init 
```

To fetch changes to the submodule from the submodule's remote:

```
git submodule update --remote
```


