# d-mediawiki

This directory contains a Dockerfile that adds a slight tweak 
to the official MediaWiki docker container. Before launching
the container, it specifies /var/www/html as a volume, and it 
copies LocalSettings.php, the MediaWiki config file, into the 
container.

Use the build script to build the docker container from the 
Dockerfile.

Use the run script to run the docker container.
The run script expects the MySQL container to be
called `stormy_mysql` and listening on the standard
MySQL port 3306.

## hints

don't forget - if you are making changes to the files copied into the container,
either use the `--rm` flag, or remove and create the data volume.

## submodule

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
