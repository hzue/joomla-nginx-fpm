# docker-joomla

## Usage
```
docker run --link some-db:db -d -p port_number:80 seterrychen/joomla
```
Browse to http://IP:port_number to setup your Joomla and fill database host name **some-db**.


## Note
Use joomla image should create another container of database to store data, such as:
```
docker run -d --name some-db \
           -e MYSQL_ROOT_PASSWORD=joomla \
           -e MYSQL_USER=joomla \
           -e MYSQL_PASSWORD=joomla \
           -e MYSQL_DATABASE=joomla \
           mariadb
```
Or using external database.
