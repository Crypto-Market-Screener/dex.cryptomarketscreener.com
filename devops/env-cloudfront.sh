#!/bin/bash

if ! [ -x "$(command -v aws)" ]; then
  echo '==> Error: aws CLI not installed.' >&2
  else

  # ENVIRONMENT=${1:-dev}
  if [ -z $1 ]; then
    echo "==> Error: Environment is requrired"
    echo "==> Example: source ./env-cloudfront.sh dev|stagting|prod"
    return
  fi

  ENVIRONMENT=$1

  URL="${AWS_APP_ENVIRONMENT}-${AWS_APP_SUBDOMAIN}.${AWS_APP_DOMAINNAME}"

  if [ $ENVIRONMENT == "prod" ]; then
    URL="${AWS_APP_SUBDOMAIN}.${AWS_APP_DOMAINNAME}"
  fi

  export AWS_URL=$URL

  export AWS_CLOUDFRONT_DISTRIBUTION_ID=$(aws cloudfront list-distributions | jq -r ".DistributionList.Items[] | select(.Aliases.Items[0] | match(\"^${URL}\")) | .Id" )

  env | grep AWS_ | sort

  if [ -z $AWS_CLOUDFRONT_DISTRIBUTION_ID ]; then
    echo "==> Error: Cloudfront Distribution ID not set"
  fi

fi
