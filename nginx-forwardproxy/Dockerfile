FROM library/nginx:1.13.8
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

RUN apt-get update && \
    apt-get install -y --no-install-recommends openssl && \
    rm -rf /var/lib/apt/lists/* && \
    install -o root -g root -m 700 -d /etc/nginx/ssl

ADD proxy.header /etc/nginx/conf.d/
ADD entrypoint.sh /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
