# IDR submission ticketing system configuration

Redmine requires several manual configuration steps before it can be used as an email ticketing system.

## Email account
An IMAP email address that can send and receive is required, for instance create a GMail account.
- Ensure IMAP is enabled
- Enter the username and password in `config/configuration.yml`
- Create two GMail folders `RedmineSuccess` and `RedmineFailure`

# Redmine configuration

The following steps should be done from the `Administration` panel as an administrator.

## Settings
- Load the default configuration
- Under `General` set `Host name and path` and `Protocol`, set `Text formatting` to `Markdown`
- Under `Authentication` set `Authentication required`
- Under `Projects` deselect all items
- Under `Files` optionally increase the `Attachment max. size`
- Under `Email notifications` set the `Emission email address`, update the URL in `Email footer`
- Under `Incoming emails` optionally set `Truncate emails after one of these lines`
- Other settings can be changed as required

## LDAP authentication
- Add a new authentication mode using LDAP server
- Enable `On-the-fly user creation`

## Project
- Create a project `IDR Submission`
- Ensure the project is not `Public`
- In `Modules` enable `Issue tracking` and `Files`
- In `Trackers` enable `Support`

## Group
- Create a group `submitters`
- Add this group to the `IDR Submission` project with role `Reporter`

## Role
- Open the `Reporter` role (created by default)
- Set `Issues visibility`: `Issues created by or assigned to the user`
- Remove all permissions apart from `View files ` `View Issues` `Add issues` `Edit own notes`
- Under `Issue tracking` ensure the role can `View Issues` and `Add Issues` on `Support`
