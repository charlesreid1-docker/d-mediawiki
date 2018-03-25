FROM mediawiki

VOLUME ["/var/www/html"]

# Copy skins, config files, and other particulars into container
COPY charlesreid1-config/mediawiki/LocalSettings.php  /var/www/html/
COPY charlesreid1-config/mediawiki/root.password.php  /var/www/html/

COPY charlesreid1-config/mediawiki/skins/Bootstrap2   /var/www/html/skins/Bootstrap2

#COPY charlesreid1-config/mediawiki/extensions/EmbedVideo              /var/www/html/extensions/EmbedVideo
#COPY charlesreid1-config/mediawiki/extensions/Math                    /var/www/html/extensions/Math
#COPY charlesreid1-config/mediawiki/extensions/ParserFunctions         /var/www/html/extensions/ParserFunctions
#COPY charlesreid1-config/mediawiki/extensions/SyntaxHighlight_GeSHi   /var/www/html/extensions/SyntaxHighlight_GeSHi

RUN chown www-data:www-data /var/www/html/LocalSettings.php
RUN chown www-data:www-data /var/www/html/root.password.php

RUN chmod 600 /var/www/html/LocalSettings.php
RUN chmod 600 /var/www/html/root.password.php

# Apache conf file
COPY charlesreid1-config/apache/wiki.conf /etc/apache2/sites-enabled/wiki.conf

# PHP conf file
# https://hub.docker.com/_/php/
#COPY config/php.ini /usr/local/etc/php/
