#!/bin/bash
# 
# fix LocalSettings.php in the mediawiki container.
# 
# docker is stupid, so it doesn't let you bind mount
# a single file into a docker volume.
# 
# so, rather than rebuilding the entire goddamn container
# just to update LocalSettings.php when it changes, we just
# use a docker cp command to copy it into the container.

NAME="podcharlesreid1_stormy_mw_1"
echo "Installing LocalSettings.php into $NAME"
docker cp charlesreid1-config/mediawiki/LocalSettings.php $NAME:/var/www/html/LocalSettings.php
docker exec -it $NAME /bin/bash -c 'chown www-data:www-data /var/www/html/LocalSettings.php'
docker exec -it $NAME /bin/bash -c 'chmod 600 /var/www/html/LocalSettings.php'
echo "Finished installing LocalSettings.php into $NAME"
