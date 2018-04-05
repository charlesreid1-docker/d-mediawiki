#!/bin/bash
# 
# fix skins in the mediawiki container,
# because docker is a big fat idiot.

NAME="podcharlesreid1_stormy_mw_1"
echo "Installing skins into $NAME"
docker exec -it $NAME /bin/bash -c 'rm -rf /var/www/html/skins'
docker cp charlesreid1-config/mediawiki/skins $NAME:/var/www/html/skins
docker exec -it $NAME /bin/bash -c 'chown -R www-data:www-data /var/www/html/skins'
echo "Finished installing skins into $NAME"

