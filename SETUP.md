# IDR submission ticketing system configuration

Redmine requires several manual configuration steps before it can be used as an email ticketing system.

## Email account
An IMAP email address that can send and receive is required, for instance create a GMail account.
- Ensure IMAP is enabled
- Enter the username and password in `config/configuration.yml`
- Create two GMail folders `RedmineSuccess` and `RedmineFailure`

Optionally configure an email alias in GMail.
- In `Settings`, `Accounts and import`, `Send mail as` add the email alias as an address, select `Treat as an alias`, and make it the `default`


# Redmine configuration

The following steps should be done from the `Administration` panel as an administrator.

## Settings
- Load the default configuration
- Under `General` set `Host name and path` and `Protocol`, set `Text formatting` to `Markdown`
- Under `Display` set `Project menu tab for creating new objects` to `Display the "New issue" Tab`
- Under `Authentication` set `Authentication required`
- Under `Projects` deselect all items
- Under `Files` optionally increase the `Attachment max. size`
- Under `Email notifications` set the `Emission email address`, set the `Email header` to `# ********** **Please reply above this line** **********` and update the URL in `Email footer`
- Under `Incoming emails` set `Truncate emails after one of these lines`, `.+[Rr]eply above this line.+` and tick `Enable regular expressions`
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
- Remove all permissions apart from `View files ` `View Issues` `Add issues` `Edit own notes`, `View wiki`
- Under `Issue tracking` ensure the role can `View Issues` and `Add Issues` on `Support`
- In `Roles` `Permissions report` tick `Hide in memberbox` for all roles
- For the two roles `Mon member` and `Anonymous` uncheck all permissions apart from `Hide in memberbox`

### Additionals Plugin for Redmine
The IDR Redmine Docker image includes [Additionals Plugins for Redmine](https://additionals.readthedocs.io) for additional configuration.
Open `Administration`, `Additionals`:
- Under `General` set some custom text
- Under `Overview page` set some custom text for `top` (provide an introduction to the system) and `bottom` (provide contact information in case of problems)
- Under `Projects` set some custom text for `Project guide`

### Custom IDR template overrides
Some Redmine templates are overridden by the [idr_overrides plugin](docker/idr_overrides).
If you upgrade Redmine you may need to update these to match any new templates.

## Other setup

### Mailman list subscription
You can configure Redmine to copy all emails to a mailing list.
- Create an internal Redmine account for the list email address
- Set `Email notifications` to `For any event on all my projects`
- In the project `IDR Submission` add the list user as a `New member` to group `IDR Submission` as a `Developer`
- **Do not** add the Redmine email address to the mailing list or you will create an email loop
- **Remember**, if you have your own email account that is subscribed to the mailing list and also receive notifications from Redmine account you may receive duplicate emails

### Default admin account
Convert an existing LDAP user to Redmine `Administrator` and delete the default `admin` account.

### New developer accounts
- Ask new user to login with LDAP
- Add user to the `IDR Submissions` project with role `Developer` (Under `Users` click on user, `Projects`, `IDR submission`, `edit`)
- User should modify email notification settings to `For any event on all my projects`
- User should change their email address from the default LDAP to the address normally used as the sender address (e.g. exclude dots if necessary), or add other addresses that they use.

### Issue statuses
Add or modify statuses in under `Administration` `Issue statuses`

### LDAP email addresses
If the LDAP email does not match your normal email (used as the sender address on replies) change it.
