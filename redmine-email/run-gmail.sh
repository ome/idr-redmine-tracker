#!/bin/bash

echo "$(date --iso-8601=seconds): $0"
cd /usr/src/redmine

GMAIL_USER=$(sed -nre 's/^\s*user_name:\s*"(.+)"/\1/p' /usr/src/redmine/config/configuration.yml)
GMAIL_PASS=$(sed -nre 's/^\s*password:\s*"(.+)"/\1/p' /usr/src/redmine/config/configuration.yml)
GMAIL_FOLDER_SUCCESS=RedmineSuccess
GMAIL_FOLDER_FAILURE=RedmineFailure
REDMINE_PROJECT=idr-submission
REDMINE_GROUPS=submitters

# These environment variables are set in Docker image library/redmine:3.4.4
# but are lost when cron is run
export \
    GEM_HOME=/usr/local/bundle \
    BUNDLE_PATH=/usr/local/bundle \
    BUNDLE_BIN=/usr/local/bundle/bin \
    BUNDLE_APP_CONFIG=/usr/local/bundle \
    PATH=PATH=/usr/local/bundle/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# See https://github.com/redmine/redmine/blob/3.4.4/lib/tasks/email.rake
# for explanation of settings
/usr/local/bundle/bin/rake -f /usr/src/redmine/Rakefile \
    redmine:email:receive_imap \
    RAILS_ENV="production" \
    host=imap.gmail.com \
    username="$GMAIL_USER" \
    password="$GMAIL_PASS" \
    ssl=1 \
    port=993 \
    unknown_user=create \
    move_on_success="$GMAIL_FOLDER_SUCCESS" \
    move_on_failure="$GMAIL_FOLDER_FAILURE" \
    project="$REDMINE_PROJECT" \
    tracker=Support \
    no_permission_check=1 \
    default_group="$REDMINE_GROUPS"

if [ $? -ne 0 ]; then
    echo "FAILED"
    exit 1
fi
