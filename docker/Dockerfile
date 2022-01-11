FROM library/redmine:3.4.6
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

# https://additionals.readthedocs.io/en/latest/#installation
RUN git clone -b 2.0.12 https://github.com/alphanodes/additionals.git plugins/additionals
# Custom IDR template overrides
ADD idr_overrides/ /usr/src/redmine/plugins/idr_overrides/

# Allow watchers to see issues they couldn't otherwise see:
# https://www.redmine.org/issues/14318#note-36
RUN apt-get update -q && \
    apt-get install -y -q patch && \
    patch -p0 < /usr/src/redmine/plugins/idr_overrides/patches/allow_watchers_and_contributers_access_to_issues_3.4.2.patch && \
    apt-get remove -y -q patch

RUN bundle install --without development test
#    bundle exec rake redmine:plugins:migrate RAILS_ENV=production
