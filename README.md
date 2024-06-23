# Lego route53 automated

- Docker configuration to create tls certificates for https.
- Automatic certificates renovation.

## Tools

- [Lego](https://go-acme.github.io/lego/)
- [crond](https://www.linux.org/docs/man8/cron.html)

## Environment variables

```BASH
# Email value to use in the certificate creation
CERTIFICATE_EMAIL="email here"
# Domain where the certificate is available
DOMAIN="domain here"

# Aws iam credentials. Fallow lego documentation for route53
# https://go-acme.github.io/lego/dns/route53/
#
AWS_ACCESS_KEY_ID="your key id"
AWS_SECRET_ACCESS_KEY="your secret access key"
AWS_REGION="aws region"
AWS_HOSTED_ZONE_ID="your hosted zone id"
```
