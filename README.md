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

# Aws iam credentials. Follow lego documentation for route53
# https://go-acme.github.io/lego/dns/route53/
#
AWS_ACCESS_KEY_ID="your key id"
AWS_SECRET_ACCESS_KEY="your secret access key"
AWS_REGION="aws region"
AWS_HOSTED_ZONE_ID="your hosted zone id"
```

## Example with `docker-compose`

```YAML
services:
  cron:
    image: lego-route53-auto
    container_name: lego-route53-auto
    build:
      context: .
    restart: unless-stopped
    volumes:
      - ./certs:/root/certs
    environment:
      - CERTIFICATE_EMAIL=${CERTIFICATE_EMAIL}
      - DOMAIN=${DOMAIN}
      - AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
      - AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
      - AWS_REGION=${AWS_REGION}
      - AWS_HOSTED_ZONE_ID=${AWS_HOSTED_ZONE_ID}
```
