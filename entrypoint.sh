#!/bin/bash

JOOMLA_HOME=/var/www/html/joomla
sed -i 's|default="localhost"|default="'"$DB_HOST"'"|' $JOOMLA_HOME/installation/model/forms/database.xml
sed -i 's|label="INSTL_DATABASE_USER_LABEL"$|label="INSTL_DATABASE_USER_LABEL" default="'"$DB_USER"'"|' $JOOMLA_HOME/installation/model/forms/database.xml
sed -i 's|label="INSTL_DATABASE_PASSWORD_LABEL"$|label="INSTL_DATABASE_PASSWORD_LABEL" default="'"$DB_PASSWORD"'"|' $JOOMLA_HOME/installation/model/forms/database.xml
sed -i 's|label="INSTL_DATABASE_NAME_LABEL"$|label="INSTL_DATABASE_NAME_LABEL" default="'"$DB_NAME"'"|' $JOOMLA_HOME/installation/model/forms/database.xml

/bin/bash /start.sh
