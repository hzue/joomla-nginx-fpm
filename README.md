# joomla-nginx-fpm

Joomla on Nginx. Using php7 7.0.8, Nginx 1.10.1 and Alpine 3.4.

## Usage
```
docker run -d -p 8080:80 \
           -e DB_HOST=mysql \
           -e DB_USER=joomla \
           -e DB_DB_PASSWORD=joomla \
           -e DB_NAME=joomla \
           --link some-db:mysql seterrychen/joomla-nginx-fpm:3.6.0
```
Browse to http://IP:port_number to setup your Joomla.


## Note
Use the image should create a database container to store data, such as:
```
docker run -d --name some-db \
           -e MYSQL_ROOT_PASSWORD=joomla \
           -e MYSQL_USER=joomla \
           -e MYSQL_PASSWORD=joomla \
           -e MYSQL_DATABASE=joomla \
           mariadb
```
