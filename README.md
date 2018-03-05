# IDR submission ticketing system

This is an email ticketing system for handling IDR data submissions.
The primary aim is to manage multiple complex email threads concerning data submissions to the IDR.

## Requirements

- All emails should be visible by the OME team
- Any member of the public should be able to email the system
- Emails may contain confidential information and must not be visible to others
- Emails should be sent and received via a dedicated email address
- OME team members email addresses should not be visible to data submitters

## Deployment

This application is deployed on Kubernetes using Helm along with the manifests in [k8s](k8s).

To run this:
- Add your PostgreSQL and GMail credentials to [secret-config.yaml.example](k8s/secret-config.yaml.example)
- Change [pv-nfs.yml](k8s/pv-nfs.yml) to point to a persistent volume
- Create the Kubernetes namespace: `kubectl create namespace idr-redmine`
- Create the Kubernetes resources: `kubectl -n idr-redmine apply -f k8s`
  These are not currently managed using Helm since volumes are persistent and should not be destroyed, and at present the private configuration may be stored in a non-accessible location
- Install the application using Helm: `helm upgrade --install idr-redmine ./chart/`
- Note the purpose of this Helm chart is to manage internal applications using standard tools, and in the current state is not customisable, nor does it follow best practice for a public chart.

## Issues to be discussed

- Should submitters have a login to the system, or should everything be done by email only?
- Should the quoted section of email replies be discarded (works if everyone top-posts, fails if replies are bottom-posted or in-line)
