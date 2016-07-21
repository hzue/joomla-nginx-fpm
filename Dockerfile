FROM richarvey/nginx-php-fpm:php7
MAINTAINER Terry Chen <seterrychen@gmail.com>

ENV JOOMLA_VERSION 3.6.0
ENV JOOMLA_SHA1 9e71357f689218705b15e653b7cdd57b498d4fa4
ENV DB_NAME joomla
ENV DB_USER joomla
ENV DB_PASSWORD joomla

RUN curl -o joomla.zip -SL https://github.com/joomla/joomla-cms/releases/download/${JOOMLA_VERSION}/Joomla_${JOOMLA_VERSION}-Stable-Full_Package.zip \
  && echo "$JOOMLA_SHA1 *joomla.zip" | sha1sum -c - \
  && rm /var/www/html/index.php \
  && mkdir /var/www/html/joomla \
  && unzip joomla.zip -d /var/www/html/joomla \
  && chown -R nginx:nginx /var/www/html/joomla \
  && rm joomla.zip

ADD entrypoint.sh /entrypoint.sh

# change site config
RUN sed -i 's|location / |location /joomla/ |' /etc/nginx/sites-available/default.conf \
  && sed -i 's|/index.php|/joomla/index.php|' /etc/nginx/sites-available/default.conf \
  && sed -r 's|^(Options -Indexes.*)$|#\1|' /var/www/html/joomla/htaccess.txt > /var/www/html/joomla/.htaccess

CMD ["/entrypoint.sh"]
