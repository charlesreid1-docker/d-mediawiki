FROM mediawiki

EXPOSE 8989

VOLUME ["/var/www/html"]

# Install ImageMagick
# and math stuff mentioned by Math extension readme
RUN apt-get update && \
    apt-get install -y build-essential \
            dvipng \
            ocaml \
            ghostscript \
            imagemagick \
            texlive-latex-base \
            texlive-latex-extra \
            texlive-fonts-recommended \
            texlive-lang-greek \
            texlive-latex-recommended

# Copy skins, config files, and other particulars into container

# Skins
COPY charlesreid1-config/mediawiki/skins /var/www/html/skins

# Settings
COPY charlesreid1-config/mediawiki/LocalSettings.php /var/www/html/LocalSettings.php
RUN chown www-data:www-data /var/www/html/LocalSettings.php
RUN chmod 600 /var/www/html/LocalSettings.php

# Extensions
COPY charlesreid1-config/mediawiki/extensions/EmbedVideo              /var/www/html/extensions/EmbedVideo
COPY charlesreid1-config/mediawiki/extensions/Math                    /var/www/html/extensions/Math
COPY charlesreid1-config/mediawiki/extensions/ParserFunctions         /var/www/html/extensions/ParserFunctions
COPY charlesreid1-config/mediawiki/extensions/SyntaxHighlight_GeSHi   /var/www/html/extensions/SyntaxHighlight_GeSHi

RUN chown -R www-data:www-data /var/www/html/*

# Apache conf file
COPY charlesreid1-config/apache/wiki.conf /etc/apache2/sites-enabled/wiki.conf
COPY charlesreid1-config/apache/ports.conf /etc/apache2/ports.conf
RUN a2enmod rewrite
RUN service apache2 restart

# PHP conf file
# https://hub.docker.com/_/php/
#COPY config/php.ini /usr/local/etc/php/

# make texvc
CMD cd /var/www/html/extensions/Math/math && make && apache2-foreground

