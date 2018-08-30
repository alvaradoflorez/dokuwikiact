FROM ubuntu:16.04


RUN apt-get update
RUN apt-get -y install wget
RUN apt-get -y install php7.0
RUN apt-get -y install php-mbstring
RUN apt-get -y install php7.0-xml
RUN apt-get -y install libapache2-mod-php apache2



WORKDIR /var/www/html
 
RUN wget https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz
RUN tar xvf dokuwiki-stable.tgz
RUN rm /var/www/html/index.html
RUN mv dokuwiki-2018-04-22a/* .
RUN rm -R dokuwiki-2018-04-22a
RUN chown -R www-data:www-data /var/www/html
RUN service apache2 restart
EXPOSE 80
CMD apache2ctl -D FOREGROUND

