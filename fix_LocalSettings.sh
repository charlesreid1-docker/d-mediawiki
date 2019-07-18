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

NAME="pod-charlesreid1_stormy_mw_1"
echo "Installing LocalSettings.php into $NAME"
docker cp charlesreid1-config/mediawiki/LocalSettings.php $NAME:/var/www/html/LocalSettings.php
docker exec -it $NAME /bin/bash -c "chown www-data:www-data /var/www/html/LocalSettings.php"
docker exec -it $NAME /bin/bash -c "chmod 600 /var/www/html/LocalSettings.php"
echo "Finished installing LocalSettings.php into $NAME"

FILES="/var/www/html/docs
/var/www/html/includes
/var/www/html/languages
/var/www/html/maintenance
/var/www/html/mw-config
/var/www/html/tests
/var/www/html/vendor"

for file in $FILES
do
    echo "Installing $file into $NAME"
    docker exec -it $NAME /bin/bash -c "chown www-data:www-data $file"
    docker exec -it $NAME /bin/bash -c "chmod 600 $file"
    echo "Finished installing $file into $NAME"
done

