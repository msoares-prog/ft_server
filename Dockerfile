FROM debian:buster

# install

RUN	apt-get -y update && \
	apt-get -y upgrade && \
	apt-get -y install wget && \
	apt-get -y install apt-utils && \
	apt-get -y install nginx && \
	apt-get -y install curl && \
	apt-get -y install php7.3-fpm php7.3-common php7.3-mysql php7.3-gmp php7.3-curl php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-gd php7.3-xml php7.3-cli php7.3-zip php7.3-soap php7.3-imap && \
	apt-get install -y mariadb-server mariadb-client && \
	apt-get install -y default-mysql-server

#copy
COPY 	./srcs/nginx.conf ./tmp
COPY	./srcs/phpmyadmin.inc.php ./tmp/phpmyadmin.inc.php
COPY	./srcs/wp-config.php ./tmp/wp-config.php
COPY	./srcs/container_init.sh ./

CMD ["nginx", "-g", "daemon off;"]
CMD bash ./container_init.sh

EXPOSE 80 443 3306
