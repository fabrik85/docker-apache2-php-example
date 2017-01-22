FROM php:7-apache
MAINTAINER Attila Fabrik <fabrik85@gmail.com>

# Apache & PHP configuration
RUN a2enmod rewrite
COPY apache2/vhost.conf /etc/apache2/sites-enabled/000-default.conf
ADD php.ini /usr/local/etc/php/php.ini

# Add/Copy Resources
COPY apache2 /apache2
ADD web /web

WORKDIR /web

# Ensure that the production container will run with the www-data user
RUN chown www-data /web

CMD ["/apache2/run.sh"]