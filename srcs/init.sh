service nginx start
service mysql start
service php7.3-fpm start
sh dbconfig.sh
cd /etc/nginx/sites-available/
sh autoindex.sh
tail -F /dev/null
tail -f /var/log/nginx/access.log /var/log/nginx/error.log
