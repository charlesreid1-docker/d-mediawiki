#!/bin/bash
#
# Run mediawiki in docker
#
# Awesome:
# https://github.com/benhutchins/docker-mediawiki
#
#
#
# mediawiki data directory may contain:
# LocalSettings.php
# images
# skins
# extensions
# 
# to enable ssl, data directory must contain:
# ssl.key
# ssl.crt
# ssl.bundle.crt

MW_SERVER="192.155.84.98"
HOST_PORT="80"

#docker pull mediawiki

docker container prune -f

# eventually this will listen on 8008
# like the apache reverse proxy on rojo
docker run \
    --rm \
    --name stormy_mw \
    --link stormy_mysql:mysql \
    -v stormy_mw_data:/var/www/html \
    -p ${HOST_PORT}:80 \
    -e MEDIAWIKI_SITE_SERVER=${MW_SERVER} \
    -e MEDIAWIKI_DB_HOST="mysql" \
    -e MEDIAWIKI_DB_NAME="wikidb" \
    -e MEDIAWIKI_DB_USER="root" \
    -e MEDIAWIKI_DB_PASSWORD="zeno135" \
    -d \
    super_mediawiki

#    -e MEDIAWIKI_ENABLE_SSL=true \

