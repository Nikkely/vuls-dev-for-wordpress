FROM wordpress:latest

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp \
  && wp --info

RUN mkdir -p /opt/vuls

COPY ./vuls/vuls /opt/vuls
COPY ./vuls/config.toml /opt/vuls
RUN chmod 777 /opt/vuls/vuls

RUN apt update
RUN apt install sudo -y
RUN apt install default-mysql-client-core -y
RUN apt install vim -y
