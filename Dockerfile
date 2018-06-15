FROM richarvey/nginx-php-fpm:php7
MAINTAINER Terry Chen <seterrychen@gmail.com>

ENV \
  JOOMLA_VERSION=3.8.1 \
  JOOMLA_SHA1=b31e97ef16e6030156600b4b9e8073eaf3b28928 \
  JOOMLA_INSTALLATION_DISABLE_LOCALHOST_CHECK=1 \
  WEB_ROOT=/var/joomla \
  DB_NAME=joomla \
  DB_USER=joomla \
  DB_PASSWORD=joomla \
  IPV6_LISTEN=false

RUN curl -o joomla.zip -SL https://github.com/joomla/joomla-cms/releases/download/${JOOMLA_VERSION}/Joomla_${JOOMLA_VERSION}-Stable-Full_Package.zip \
  && echo "$JOOMLA_SHA1 *joomla.zip" | sha1sum -c - \
  && mkdir $WEB_ROOT \
  && unzip joomla.zip -d $WEB_ROOT \
  && chown -R nginx:nginx $WEB_ROOT \
  && rm joomla.zip

RUN sed -r 's|^(Options -Indexes.*)$|#\1|' ${WEB_ROOT}/htaccess.txt > ${WEB_ROOT}/.htaccess

ADD entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]
