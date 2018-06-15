#!/bin/bash

if ! grep -iq joomla /var/www/html/index.php; then
    echo "Joomla not found in /var/www/html - copying now..."
    rm -f /var/www/html/index.php
    sed -i 's|default="localhost"|default="'"$DB_HOST"'"|' $WEB_ROOT/installation/model/forms/database.xml
    sed -i 's|label="INSTL_DATABASE_USER_LABEL"$|label="INSTL_DATABASE_USER_LABEL" default="'"$DB_USER"'"|' $WEB_ROOT/installation/model/forms/database.xml
    sed -i 's|label="INSTL_DATABASE_PASSWORD_LABEL"$|label="INSTL_DATABASE_PASSWORD_LABEL" default="'"$DB_PASSWORD"'"|' $WEB_ROOT/installation/model/forms/database.xml
    sed -i 's|label="INSTL_DATABASE_NAME_LABEL"$|label="INSTL_DATABASE_NAME_LABEL" default="'"$DB_NAME"'"|' $WEB_ROOT/installation/model/forms/database.xml
    cp -r $WEB_ROOT/* /var/www/html/ # no rsync in the base image
    echo "Complete! Joomla has been successfully copied to /var/www/html"
fi

# setting ipv6 config
if [ x"$IPV6_LISTEN" == x"false" ]; then
    sed -i 's|listen   \[\:\:\]\:80|#listen   \[\:\:\]\:80|' /etc/nginx/sites-available/default.conf
fi

exec /bin/bash /start.sh
