FROM richarvey/nginx-php-fpm:php7
MAINTAINER Terry Chen <seterrychen@gmail.com>

ENV \
  JOOMLA_VERSION=3.6.0 \
  JOOMLA_SHA1=9e71357f689218705b15e653b7cdd57b498d4fa4 \
  DB_NAME=joomla \
  DB_USER=joomla \
  DB_PASSWORD=joomla \
  IPV6_LISTEN=false

RUN curl -o joomla.zip -SL https://github.com/joomla/joomla-cms/releases/download/${JOOMLA_VERSION}/Joomla_${JOOMLA_VERSION}-Stable-Full_Package.zip \
  && echo "$JOOMLA_SHA1 *joomla.zip" | sha1sum -c - \
  && rm /var/www/html/index.php \
  && mkdir /var/joomla \
  && unzip joomla.zip -d /var/joomla \
  && chown -R nginx:nginx /var/joomla \
  && rm joomla.zip

RUN sed -r 's|^(Options -Indexes.*)$|#\1|' /var/joomla/htaccess.txt > /var/joomla/.htaccess

ADD entrypoint.sh /entrypoint.sh

VOLUME ["/usr/joomla"]
CMD ["/entrypoint.sh"]
