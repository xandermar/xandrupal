FROM drupal

RUN apt-get update && \
    apt-get install -y wget vim git
    
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/local/bin/composer

ADD https://raw.githubusercontent.com/xandermar/xandrupal/master/settings.php /var/www/html/sites/default/

RUN chown -R www-data:www-data sites modules themes && \
    mkdir /var/www/private && \
    chown -R www-data:www-data /var/www/private
