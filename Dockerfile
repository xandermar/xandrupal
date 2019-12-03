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

RUN composer update && \
    composer require drush/drush && \
    composer require predis/predis && \
    composer require drupal/admin_toolbar && \
    composer require drupal/bootstrap && \
    composer require drupal/svg_image && \
    composer require drupal/address && \
    composer require drupal/printfriendly && \
    composer require drupal/views_bulk_operations && \
    composer require drupal/taxonomy_manager && \
    composer require drupal/content_sync && \
    composer require drupal/feeds && \
    composer require drupal/mass_password_change && \
    composer require drupal/honeypot && \
    composer require drupal/swiftmailer && \
    composer require drupal/module_filter
