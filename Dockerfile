FROM mediawiki

VOLUME ["/var/www/html"]

# Copy skins, config files, and other particulars into container
COPY charlesreid1-config/LocalSettings.php  /var/www/html/
COPY charlesreid1-config/root.password.php  /var/www/html/

#COPY charlesreid1-config/skins/Bootstrap2   /var/www/html/skins/Bootstrap2

#COPY charlesreid1-config/extensions/EmbedVideo              /var/www/html/extensions/EmbedVideo
#COPY charlesreid1-config/extensions/Math                    /var/www/html/extensions/Math
#COPY charlesreid1-config/extensions/ParserFunctions         /var/www/html/extensions/ParserFunctions
#COPY charlesreid1-config/extensions/SyntaxHighlight_GeSHi   /var/www/html/extensions/SyntaxHighlight_GeSHi

RUN chown www-data:www-data /var/www/html/LocalSettings.php
RUN chown www-data:www-data /var/www/html/root.password.php

RUN chmod 600 /var/www/html/LocalSettings.php
RUN chmod 600 /var/www/html/root.password.php

# Apache conf file
COPY charlesreid1-config/charlesreid1_wiki.conf /etc/apache2/sites-enabled/charlesreid1_wiki.conf

# PHP conf file
# https://hub.docker.com/_/php/
#COPY config/php.ini /usr/local/etc/php/
