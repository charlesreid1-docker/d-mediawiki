#!/bin/bash
# 
# fix skins in the mediawiki container.
# 
# docker is stupid, so it doesn't let you bind mount
# a single file into a docker volume.
#
# so, rather than rebuilding the entire goddamn container
# just to update the skin when it changes, we just
# use a docker cp command to copy it into the container.

NAME="pod-charlesreid1_stormy_mw_1"
echo "Installing skins into $NAME"
docker exec -it $NAME /bin/bash -c 'rm -rf /var/www/html/skins'
docker cp charlesreid1-config/mediawiki/skins $NAME:/var/www/html/skins
docker exec -it $NAME /bin/bash -c 'chown -R www-data:www-data /var/www/html/skins'
echo "Finished installing skins into $NAME"

