FROM ubuntu:14.04
MAINTAINER Igor Mukhin <igor.mukhin@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y php5-cli
RUN apt-get install -y curl
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY . /var/www
WORKDIR /var/www
RUN composer install --no-dev

EXPOSE 8080

CMD ["/usr/bin/php", "-S", "0.0.0.0:8080", "-t", "web", "web/index.php"]
