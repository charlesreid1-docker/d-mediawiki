FROM mediawiki

VOLUME ["/var/www/html"]

# Copy skins, config files, and other particulars into container
COPY charlesreid1-config/LocalSettings.php /var/www/html/
COPY charlesreid1-config/root.password.php /var/www/html/
COPY charlesreid1-config/skins/Bootstrap2 /var/www/html/skins/Bootstrap2

# What about extensions?? 
# No easy way to do that except a script.
# Copy in a script and run it.
# Should check out MW extensions from git.

RUN chown www-data:www-data /var/www/html/LocalSettings.php
RUN chown www-data:www-data /var/www/html/root.password.php

RUN chmod 600 /var/www/html/LocalSettings.php
RUN chmod 600 /var/www/html/root.password.php

