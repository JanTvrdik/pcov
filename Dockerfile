FROM php:8.2-cli

RUN apt-get update && \
    apt-get install -y hyperfine

COPY ./ /pcov

RUN cd /pcov && \
    phpize && \
    ./configure --enable-pcov && \
    make && \
    make install && \
    docker-php-ext-enable pcov

# docker build . -t php-pcov && (cd /p/shipmonk-input-mapper && drish php-pcov hyperfine 'php -dpcov.exclude="#^(?!/p/shipmonk-input-mapper/src/Compiler/Mapper/Scalar)#" vendor/bin/phpunit')
