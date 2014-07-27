# apache2 docker

## Build apache2 docker image
```
git clone git@github.com:eg5846/apache2-docker.git
cd apache2-docker
sudo docker build -t eg5846/apache2-docker .

# Pushing image to registry.hub.docker.com is no longer required!!!
# Image build is automatically initiated after pushing commits of project to github.com
# sudo docker push eg5846/apache2-docker
```

## Run apache2 docker image
```
sudo docker run -d -P --name mysqlsrv eg5846/mysql-docker
sudo docker run -d -p 80:80 -v /export/docker/site.de:/var/www/html --link mysqlsrv:mysql --name site.de eg5846/apache2-docker
```

