FROM eg5846/ubuntu-docker:trusty
MAINTAINER Andreas Egner <andreas.egner@web.de>

# Update system and install packages
RUN \
  apt-get update && \
  apt-get dist-upgrade -y --no-install-recommends && \
  apt-get install -y --no-install-recommends apache2 libapache2-mod-php5 php5-gd php5-mysql &&\
  apt-get autoremove -y && \
  apt-get clean

# Add run script
ADD run.sh /run.sh
RUN chmod 0755 /run.sh

VOLUME /var/www/html

# TODO: Expose volume with apache logs?

EXPOSE 80
CMD ["/run.sh"]
