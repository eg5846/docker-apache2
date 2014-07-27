FROM ubuntu:trusty
MAINTAINER Andreas Egner <andreas.egner@web.de>

# Set environment variables
ENV DEBIAN_FRONTEND noninteractive

# Modify inputrc
RUN \
  sed -i 's/^#\s*\(.*history-search-backward\)$/\1/g' /etc/inputrc && \
  sed -i 's/^#\s*\(.*history-search-forward\)$/\1/g' /etc/inputrc

# Replace sources list
ADD sources.list /etc/apt/sources.list

# Upgrade system
RUN \
  apt-get update && \
  apt-get dist-upgrade -y --no-install-recommends && \
  apt-get autoremove -y && \
  apt-get clean

# Install packages
RUN \
  apt-get install -y --no-install-recommends apache2 libapache2-mod-php5 php5-gd php5-mysql &&\
  apt-get clean

# Add run script
ADD run.sh /run.sh
RUN chmod 0755 /run.sh

VOLUME /var/www/html

# TODO: Expose volume with apache logs?

EXPOSE 80
CMD ["/run.sh"]
