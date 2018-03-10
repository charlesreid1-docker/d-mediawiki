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


