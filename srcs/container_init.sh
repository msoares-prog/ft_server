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
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout localhost.key -out localhost.crt -config localhost.conf

# Config NGINX
cp localhost.crt /etc/ssl/certs/localhost.crt
cp localhost.key /etc/ssl/private/localhost.key
mv ./tmp/localhost.conf /etc/nginx/sites-available/localhost
ln -s /etc/nginx/site-available/localhost /etc/nginx/sites-enabled/localhost
echo -e "127.0.0.1      localhost" >> /etc/hosts
rm -rf /etc/nginx/sites-enabled/default
chmod 600 /etc/ssl/certs/localhost.crt /etc/ssl/private/localhost.key

# conf MySQL
echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "update mysql.user set plugin='mysql_native_password' where user='root';" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password

#phpadm
mkdir /var/www/localhost/phpmyadmin
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
tar -xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz --strip-components 1 -C /var/www/localhost/phpmyadmin
mv ./tmp/phpmyadmin.inc.php /var/www/localhost/phpmyadmin/config.inc.php
mysql phpmyadmin < ./tmp/phpmyadmin.sql

#wp
cd /tmp/
wget -c https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz
mv wordpress/ /var/www/localhost
mv /tmp/wp-config.php /var/www/localhost/wordpress
mysql wordpress < ./tmp/wordpress.sql

service php7.3-fpm start
service nginx start

