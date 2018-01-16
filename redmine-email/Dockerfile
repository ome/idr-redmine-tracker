FROM library/redmine:3.4.4
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

RUN apt-get update && \
    apt-get install -y --no-install-recommends cron && \
    rm -rf /var/lib/apt/lists/*

# No idea why this is necessary when using postgres but not sqlite
RUN chown redmine:redmine /usr/src/redmine/Gemfile.lock
ADD run-gmail.sh /usr/local/bin/
ADD crontab /etc/crontab

CMD ["/usr/sbin/cron",  "-f", "-L", "15"]
