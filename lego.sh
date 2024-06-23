#!/usr/bin/env bash

# PARAMS
# $1 => run | renew

# ENVIRONMENT VARIABLES
#
# CERTIFICATE_EMAIL => email value to use in the certificate creation
# DOMAIN => domain where the certificate is available
#
# https://go-acme.github.io/lego/dns/route53/
#
# AWS_ACCESS_KEY_ID=your_key_id
# AWS_SECRET_ACCESS_KEY=your_secret_access_key
# AWS_REGION=aws-region
# AWS_HOSTED_ZONE_ID=your_hosted_zone_id

OUTPUT=/root/certs

mkdir -p $OUTPUT

lego \
  --email="$CERTIFICATE_EMAIL" \
  --domains="$DOMAIN" \
  --domains="*.$DOMAIN" \
  --dns route53 \
  --path="$OUTPUT" \
  --accept-tos=true \
  $1
