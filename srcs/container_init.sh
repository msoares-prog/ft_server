service mysql start
# config
chown -R $USER:$USER /var/www/*
chmod -R 755 /var/www/*

# Generate folder
mkdir -p /var/www/localhost && touch /var/www/localhost/index.php
echo "<?php phpinfo(); ?>" >> /var/www/localhost/index.php

#SSL
mkdir /etc/ssl/certs
mkdir /etc/ssl/private
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout localhost.key -out localhost.crt

# Config NGINX
cp localhost.key /etc/ssl/private/localhost.key
cp localhost.crt /etc/ssl/certs/localhost.crt
mv ./tmp/nginx.conf /etc/nginx/sites-available/localhost
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost
rm -rf /etc/nginx/sites-enabled/default

#Config wpress
wget https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz --strip-components 1 -C /var/www/localhost/
mv ./srcs/wp-config.php /var/www/localhost/

# setup dp

echo "CREATE DATABASE wordpress;" | mysql -u root
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
echo "update mysql.user set plugin = 'mysql_native_password' where user='root';" | mysql -u root

# Config PHP
mkdir /var/www/localhost/phpmyadmin
wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz
tar -xvf phpMyAdmin-5.0.2-all-languages.tar.gz --strip-components 1 -C /var/www/localhost/phpmyadmin
mv ./tmp/phpmyadmin.inc.php /var/www/localhost/phpmyadmin

service php7.3-fpm start
service nginx start
tail -f /var/log/nginx/access.log /var/log/nginx/error.log
