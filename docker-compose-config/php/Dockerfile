FROM 	php:7.0-apache

COPY 	php.ini /usr/local/etc/php/
COPY    sendmail.sh /usr/local/etc/php/

RUN 	pecl install xdebug-2.5.0  \
    	&& docker-php-ext-enable xdebug \
    	&& apt-get update \
      	&& apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng12-dev \
    	   libmcrypt-dev libz-dev libmemcached-dev libmemcached11 libmemcachedutil2 build-essential sendmail \
      	&& docker-php-ext-install pdo_mysql mysqli mbstring gd iconv mcrypt opcache \
      	&& cp /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/ \
	    && echo "xdebug.remote_enable=On" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
        && echo "xdebug.remote_host = 10.254.254.254" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
        && echo "xdebug.idekey = PHPSTORM" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    	&& docker-php-source extract \
    	&& docker-php-source delete \
    && set -x \
    && chmod 777 /usr/local/etc/php/sendmail.sh && chmod +x /usr/local/etc/php/sendmail.sh \
    && apt-get update && apt-get install -y --no-install-recommends unzip libssl-dev libpcre3 libpcre3-dev \
    && cd /tmp \
    && curl -sSL -o php7.zip https://github.com/websupport-sk/pecl-memcache/archive/php7.zip \
    && unzip php7 \
    && cd pecl-memcache-php7 \
    && /usr/local/bin/phpize \
    && ./configure --with-php-config=/usr/local/bin/php-config \
    && make \
    && make install \
    && echo "extension=memcache.so" > /usr/local/etc/php/conf.d/ext-memcache.ini \
    && rm -rf /tmp/pecl-memcache-php7 php7.zip