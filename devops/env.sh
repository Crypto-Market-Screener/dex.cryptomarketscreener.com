#!/bin/bash

if ! [ -x "$(command -v aws)" ]; then
  echo '==> Error: aws CLI not installed.' >&2
  else

  # export AWS_APP_PROFILE=${1:-default}
  export AWS_APP_PROFILE=default

  # export AWS_APP_ENVIRONMENT=${1:-dev}
  if [ -z $1 ]; then
    echo "==> Error: Environment is requrired"
    echo "==> Example: source ./env-cloudfront.sh dev|stagting|prod"
    return
  fi
  export AWS_APP_ENVIRONMENT=$1
  export AWS_SLS_ENV=$1

  export AWS_CLIENT_TIMEOUT=900000

  export AWS_APP_SUBDOMAIN=${2:-dex}
  export AWS_APP_DOMAINNAME=${3:-cryptomarketscreener.com}
  export AWS_APP_CERTIFICATE_REGION=${4:-us-east-1}
  export AWS_APP_ACMCERTIFICATEARN=$(aws --profile $AWS_APP_PROFILE --region $AWS_APP_CERTIFICATE_REGION acm list-certificates | jq -r ".CertificateSummaryList[] | select(.DomainName | match(\"$AWS_APP_DOMAINNAME\")) | .CertificateArn")

  env | grep AWS_APP | sort

fi