#!/bin/bash
# 
# fix extensions dir in the mediawiki container
#
# in theory, we should be able to update the
# extensions folder in d-mediawiki/charlesreid1-config,
# but in reality this falls on its face.
# So, we have to fix the fucking extensions directory
# ourselves.
set -e

NAME="pod-charlesreid1_stormy_mw_1"
EXTENSIONS="SyntaxHighlight_GeSHi ParserFunctions EmbedVideo Math Fail2banlog"

echo "Replacing existing versions of MediaWiki extensions..."

for EXTENSION in $EXTENSIONS; do
    #echo "Removing old extension ${EXTENSION} from /var/www/html/extensions"
    #docker exec -it $NAME /bin/bash -c "mv /var/www/html/extensions/${EXTENSION} /var/www/html/extensions/_${EXTENSION}"
    #echo "Copying new extension ${EXTENSION} from d-mediawiki/charlesreid1-config/mediawiki/extensions"
    #docker cp charlesreid1-config/mediawiki/extensions/${EXTENSION} ${NAME}:/var/www/html/extensions
    echo "Fixing permissions on ${EXTENSION}"
    docker exec -it $NAME /bin/bash -c "chown www-data:www-data /var/www/html/extensions/${EXTENSION}"
    docker exec -it $NAME /bin/bash -c "chmod 755 /var/www/html/extensions/${EXTENSION}"
done

echo "Finished replacing extensions!"
