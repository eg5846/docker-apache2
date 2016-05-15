FROM eg5846/ubuntu:xenial
MAINTAINER Andreas Egner <andreas.egner@web.de>

# Install packages
RUN \
  apt-get install -y --no-install-recommends apache2 libapache2-mod-php php-gd php-mysql && \
  apt-get clean

# Add run script
ADD run.sh /run.sh
RUN chmod 0755 /run.sh

VOLUME /var/www/html

# TODO: Expose volume with apache logs?

EXPOSE 80
CMD ["/run.sh"]
