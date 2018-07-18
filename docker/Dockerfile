FROM library/redmine:3.4.6
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

# https://additionals.readthedocs.io/en/latest/#installation
RUN git clone -b 2.0.12 git://github.com/alphanodes/additionals.git plugins/additionals && \
    bundle install --without development test
#    bundle exec rake redmine:plugins:migrate RAILS_ENV=production
# Custom IDR template overrides
ADD idr_overrides/ /usr/src/redmine/plugins/idr_overrides/
