#!/bin/bash

JOOMLA_HOME=/var/joomla
sed -i 's|default="localhost"|default="'"$DB_HOST"'"|' $JOOMLA_HOME/installation/model/forms/database.xml
sed -i 's|label="INSTL_DATABASE_USER_LABEL"$|label="INSTL_DATABASE_USER_LABEL" default="'"$DB_USER"'"|' $JOOMLA_HOME/installation/model/forms/database.xml
sed -i 's|label="INSTL_DATABASE_PASSWORD_LABEL"$|label="INSTL_DATABASE_PASSWORD_LABEL" default="'"$DB_PASSWORD"'"|' $JOOMLA_HOME/installation/model/forms/database.xml
sed -i 's|label="INSTL_DATABASE_NAME_LABEL"$|label="INSTL_DATABASE_NAME_LABEL" default="'"$DB_NAME"'"|' $JOOMLA_HOME/installation/model/forms/database.xml

# setting RELATIVE_URL_ROOT
if [ x"$JOOMLA_RELATIVE_URL_ROOT" != x"" ]; then
  sed -i 's|location / |location '"$JOOMLA_RELATIVE_URL_ROOT"'/ |' /etc/nginx/sites-available/default.conf
  sed -i 's|$uri/ /index.php|$uri/ '"$JOOMLA_RELATIVE_URL_ROOT"'/index.php|' /etc/nginx/sites-available/default.conf
  ln -s /var/joomla /var/www/html$JOOMLA_RELATIVE_URL_ROOT
else
  rm -r /var/www/html
  ln -s /var/joomla /var/www/html
fi

exec /bin/bash /start.sh
