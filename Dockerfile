FROM mediawiki

EXPOSE 8989

VOLUME ["/var/www/html"]

# Install ImageMagick
RUN apt-get update && \
    apt-get install -y imagemagick 

# Copy skins, config files, and other particulars into container
COPY charlesreid1-config/mediawiki/LocalSettings.php  /var/www/html/

# Skins
COPY charlesreid1-config/mediawiki/skins/Bootstrap2   /var/www/html/skins/Bootstrap2

## Extensions
COPY charlesreid1-config/mediawiki/extensions/EmbedVideo              /var/www/html/extensions/EmbedVideo
COPY charlesreid1-config/mediawiki/extensions/Math                    /var/www/html/extensions/Math
COPY charlesreid1-config/mediawiki/extensions/ParserFunctions         /var/www/html/extensions/ParserFunctions
COPY charlesreid1-config/mediawiki/extensions/SyntaxHighlight_GeSHi   /var/www/html/extensions/SyntaxHighlight_GeSHi

RUN chown -R www-data:www-data /var/www/html/*
#RUN chown www-data:www-data /var/www/html/LocalSettings.php

RUN chmod 600 /var/www/html/LocalSettings.php

# Apache conf file
COPY charlesreid1-config/apache/wiki.conf /etc/apache2/sites-enabled/wiki.conf
COPY charlesreid1-config/apache/ports.conf /etc/apache2/ports.conf
RUN a2enmod rewrite
RUN service apache2 restart

# PHP conf file
# https://hub.docker.com/_/php/
#COPY config/php.ini /usr/local/etc/php/

