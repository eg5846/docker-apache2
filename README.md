# docker-apache2
Dockerfile for apache2 docker image

## Build apache2 docker image
```
git clone git@github.com:eg5846/docker-apache2.git
cd docker-apache2
sudo docker pull eg5846/ubuntu:xenial
sudo docker build -t eg5846/apache2 .
sudo docker push eg5846/apache2
```

## Run apache2 docker image
```
sudo docker run -d --restart=always -P --name mysql eg5846/mysql
sudo docker run -d --restart=always -p 80:80 -v /export/docker/site.de:/var/www/html --link mysql:mysql --name site.de eg5846/apache2
```
