FROM ubuntu:14.04
MAINTAINER Igor Mukhin <igor.mukhin@gmail.com>

RUN apt-get update && \
    apt-get install -y php5-cli && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY . /var/www

EXPOSE 8080

WORKDIR /var/www

CMD ["/usr/bin/php", "-S", "0.0.0.0:8080", "-t", "web", "web/index.php"]
