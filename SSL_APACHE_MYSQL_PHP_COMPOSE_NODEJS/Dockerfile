FROM ubuntu:18.04
LABEL maintainer="contact@asifulhaque.info"

ENV DEBIAN_FRONTEND=noninteractive
ENV MYSQL_ALLOW_EMPTY_PASSWORD=yes
#ENV DOMAIN=SSL_DOMAIN

RUN apt update \
	&& apt -y upgrade \
	&& apt install -y gnupg \
	&& apt-get install -y locales \
	&& locale-gen en_US.UTF-8 \
	&& export LANG=en_US.UTF-8 \
	&& apt-get install -y software-properties-common \
	&& add-apt-repository -y ppa:ondrej/php \
	&& apt-get update 

RUN apt-get install -y \
	vim \
	apache2 \
	curl \
	zip \
	unzip \
	php7.3 \
	php7.3-cli \
	ibapache2-mod-php7.3 \
	php7.3-mysql \
	php7.3-curl \
	php7.3-ctype \
	php7.3-uuid \
	php7.3-iconv \
	php7.3-json \
	php7.3-mbstring \ 
	php7.3-gd \
	php7.3-intl \ 
	php7.3-xml \ 
	php7.3-zip \
	php-gettext \
	php7.3-pgsql \
	php7.3-bcmath \
	php7.3-redis \
	mysql-server-5.7 \
	mysql-client-5.7 \
	nodejs \
	npm \
	&& apt-get clean \
	&& rm -rf  /var/lib/apt/lists/* /tmp/* /var/tmp/*


RUN phpenmod curl \
	# Enable some apache modules
	a2enmod rewrite \
	a2enmod ssl \
	a2enmod headers \
	# Install MySQL Server in a Non-Interactive mode. Default root password will be "root"
	echo "mysql-server-5.7 mysql-server/root_password password root" | debconf-set-selections \
	echo "mysql-server-5.7 mysql-server/root_password_again password root" | debconf-set-selections \
	# Clean up cache
	&& apt-get clean


COPY ./scripts/composer_install.sh /root/scripts/
RUN chmod +x /root/scripts/composer_install.sh
RUN /root/scripts/composer_install.sh


RUN echo 'sql-mode="ONLY_FULL_GROUP_BY,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"' >> /etc/mysql/mysql.conf.d/mysqld.cnf

COPY ./apache2/apache2.conf /etc/apache2/
COPY ./apache2/info.php /var/www/html/
COPY ./apache2/php.ini /etc/apache2/php/7.3/apache2/
COPY ./scripts/docker-run.sh /root/scripts/
RUN chmod +x /root/scripts/docker-run.sh
EXPOSE 80 443 3306 
VOLUME ["/var/lib/mysql","/var/www/html"]
ENTRYPOINT ["/root/scripts/docker-run.sh"]



