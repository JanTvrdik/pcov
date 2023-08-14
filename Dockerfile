FROM php:8.2-cli

COPY ./ /pcov

RUN cd /pcov && \
    phpize && \
    ./configure --enable-pcov && \
    make && \
    make test && \
    make install && \
    docker-php-ext-enable pcov
