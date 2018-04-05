#!/bin/bash
# 
# fix LocalSettings.php in the mediawiki container,
# because docker is a big fat idiot.
#
# because docker is so idiotic and pedantic,
# that you can't mount a file in a volume,
# and we can't seem to figure out 
# how to get this thing to rebuild the 
# Dockerfile without caching LocalSettings.php
# and also not installing the entirety of 
# LaTeX, which is just frustratingly stupid,
# and could be bypassed by creating two 
# Dockerfiles, but why the hell do I have to
# even think about this, this is so stupid,
# just let me bind-mount my stinking file
# in my stinking volume you stinking program.

NAME="podcharlesreid1_stormy_mw_1"
echo "Installing LocalSettings.php into $NAME"
docker cp charlesreid1-config/mediawiki/LocalSettings.php $NAME:/var/www/html/LocalSettings.php
docker exec -it $NAME /bin/bash -c 'chown www-data:www-data /var/www/html/LocalSettings.php'
docker exec -it $NAME /bin/bash -c 'chmod 600 /var/www/html/LocalSettings.php'
echo "Finished installing LocalSettings.php into $NAME"
