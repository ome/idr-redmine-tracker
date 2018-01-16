# IDR submission ticketing system test scenarios

## Requirements
You must have:
- `REDMINE_URL`: URL for the IDR submission system
- `REDMINE_EMAIL`: Email address for interacting with the IDR submission system
- An LDAP account including email
- An external non-LDAP email account

Notes
- Emails sent to `REDMINE_EMAIL` may take up to 10 minutes to be processed
- If you do not receive an expected email check your junk folder

## Login and settings
1. Login to `REDMINE_URL` with LDAP
2. Ask an admin to add you to the `IDR Submissions` project with roles `Manager` and `Developer`
3. Modify your email notification settings to `For any event on all my projects`

## LDAP user submit new issue
1. Send an email to `REDMINE_EMAIL` from your LDAP email address with a subject and body
2. Check that an issue has been created in the `Support` tracker of `IDR Submissions` corresponding to the sent email

## New external user submit new issue
1. Send an email to `REDMINE_EMAIL` from your external non-LDAP email address with subject and body
2. Check that you receive an email with account login details for your external email
3. Check that these login details work on `REDMINE_URL`
4. Check that an issue has been created `Support` tracker of `IDR Submissions` corresponding to the sent email
5. Check your LDAP email for an email notification corresponding to this issue

## Existing external user submit new issue
1. Send an email to `REDMINE_EMAIL` from your external non-LDAP email address with a subject and body
3. Login to `REDMINE_URL`
4. Check that an issue has been created `Support` tracker of `IDR Submissions` corresponding to the sent email
5. Check that you can also see your previously created issues
6. Check your LDAP email for an email notification corresponding to this issue

## LDAP user Redmine reply
1. Login to `REDMINE_URL` with LDAP
2. Find an issue created by an external submitter
3. Add a note (reply) to the issue: click `edit` at the bottom of the issue, enter a note, click `Submit`
4. Check your external email for a reply corresponding to this note

## LDAP user email reply
1. In your LDAP email account find an email relating to an issue created by an external user.
2. Reply to this email
3. Login to `REDMINE_URL` with LDAP
4. Check that your reply appears under the correct issue
5. Check your external email for a reply corresponding to this note

## External user email reply
1. In your external email account find an email relating to an issue created by this external user.
2. Reply to this email
3. Login to `REDMINE_URL`
4. Check that your reply appears under the correct issue
5. Check your LDAP email for a reply corresponding to this note

## Email attachments
1. Reply to an existing issue by email, include an attachment.
2. Login to `REDMINE_URL`
3. Check the attachment exists on the issue

## Security
1. Login to `REDMINE_URL` as an external user
2. Attempt to access issues that were created by a different user, e.g. by browsing, searching, or pasting a known URL. It should not be possible.
