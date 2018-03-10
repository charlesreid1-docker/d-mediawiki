FROM mediawiki

VOLUME ["/var/www/html"]

COPY LocalSettings.php /var/www/html/
RUN chown www-data:www-data /var/www/html/LocalSettings.php
RUN chmod 600 /var/www/html/LocalSettings.php

