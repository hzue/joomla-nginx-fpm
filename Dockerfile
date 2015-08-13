FROM ubuntu:14.04
MAINTAINER Terry Chen <seterrychen@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN mkdir -p /var/www/joomla
RUN \
  apt-get update && \
  apt-get install -y wget apache2 php5 php5-mysql php5-mcrypt && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/joomla/joomla-cms/releases/download/3.4.3/Joomla_3.4.3-Stable-Full_Package.tar.gz -P /tmp \
    && tar -xzvf /tmp/Joomla_3.4.3-Stable-Full_Package.tar.gz -C /var/www/joomla \
    && rm -rf /tmp/Joomla_3.4.3-Stable-Full_Package.tar.gz

RUN chown -R www-data:www-data /var/www/joomla
RUN chmod -R 775 /var/www/joomla
RUN sed -i '12s/DocumentRoot \/var\/www\/html/DocumentRoot \/var\/www\/joomla/' /etc/apache2/sites-enabled/000-default.conf
EXPOSE 80
CMD ["apache2ctl", "-D", "FOREGROUND"]
