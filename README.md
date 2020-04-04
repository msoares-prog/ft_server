# FT_SERVER @42SP
![](https://img.shields.io/badge/%C3%89cole-42SP-blue)
![](https://img.shields.io/badge/Web-Server-red)
![](https://img.shields.io/badge/Language-PHP-yellow)
## System Administration

### Description
The aim of this project is to use the "[docker](https://www.docker.com/)" technology to install a complete Web service. This service can run multiple tasks, in this case: Wordpress, phpMyAdmin, and a SQL database. For a better understanding about the project, check this [link](https://github.com/msoares-prog/ft_server/blob/master/ft_server-en.subject.pdf).

### Download
Feel free to download the project:
```
git clone https://github.com/msoares-prog/ft_server.git
```

### Using the Project
To build a docker image:
```
docker build -t ft_server .
```
Run image:
```
docker run -it -p 80:80 -p 443:443 ft_server
```
Browser:
```
https://localhost

https://localhost/wordpress

https://localhost/phpmyadmin
```
Delete image:
```
docker rm $(docker ps -a | grep ft_server | cut -d ' ' -f 1)
```

###  Utils
Some links that helped me to study for the project:

[SSL Certificate](https://www.humankode.com/ssl/create-a-selfsigned-certificate-for-nginx-in-5-minutes);   
[LEMP stack](https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mariadb-php-lemp-stack-on-debian-10);  
[Docker](https://www.youtube.com/playlist?list=PLhW3qG5bs-L99pQsZ74f-LC-tOEsBp2rK) - Playlist;  
[phpmyadmin](https://www.digitalocean.com/community/tutorials/how-to-install-phpmyadmin-from-source-debian-10);  
[Install WordPress](https://www.osradar.com/install-wordpress-debian-10/).

### Contributors
