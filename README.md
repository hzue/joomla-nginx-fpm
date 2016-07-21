# joomla-nginx-fpm

Joomla on Nginx. Using php7 7.0.8, Nginx 1.10.1 and Alpine 3.4.

## Usage
```
docker run -d -p 8080:80 \
           -e DB_HOST=mysql \
           -e DB_USER=joomla \
           -e DB_PASSWORD=joomla \
           -e DB_NAME=joomla \
           -e JOOMLA_RELATIVE_URL_ROOT=/joomla
           --link some-db:mysql seterrychen/joomla-nginx-fpm:3.6.0
```
Browse to http://localhost:8080/joomla/ to setup your Joomla.

- **DB_HOST**: no default value
- **DB_USER**: default value is joomla
- **DB_PASSWORD**: default value is joomla
- **DB_NAME**: default value is joomla
- **JOOMLA_RELATIVE_URL_ROOT**: no default value


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
