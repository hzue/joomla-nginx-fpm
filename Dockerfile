FROM joomla:3.4.3-apache
MAINTAINER Terry Chen <seterrychen@gmail.com>

ADD database.xml /usr/src/joomla/installation/model/forms/database.xml
