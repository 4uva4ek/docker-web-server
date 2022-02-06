FROM 	php:7.4-fpm
#COPY 	php.ini /usr/local/etc/php/
    # Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN  apt-get update \
    && apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libonig-dev libz-dev git unzip libssl-dev libpcre3 libpcre3-dev libzip-dev zip telnet beanstalkd
RUN docker-php-ext-install pdo_mysql mysqli mbstring iconv opcache zip \
    #&& docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install bcmath \
    && pecl install xdebug-3.1.2  \
    && docker-php-ext-enable xdebug \
    && echo "xdebug.mode=debug" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.start_with_request=trigger" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "#!/bin/bash" >> /start.sh \
    && echo "php-fpm &" >> /start.sh \
    && echo "beanstalkd -V -p 11300" >> /start.sh \
    && chmod +x /start.sh
VOLUME ["/binlog"]
EXPOSE 11300
#CMD ["/start.sh"]
ENTRYPOINT ["/start.sh"]