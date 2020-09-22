## [sollet.cryptomarketscreener.com](https://sollet.cryptomarketscreener.com)

Create an AWS S3 and Cloudfront Static Site for the Serum SPL wallet (sollet) Client UI.

Clone and deploy the UI code to [sollet.cryptomarketscreener.com](https://sollet.cryptomarketscreener.com)

This application is build around the UNIX command line.

## Set the application envrionment first:

1. dev
   - `export AWS_SLS_ENV=dev`
2. prod
   - `export AWS_SLS_ENV=prod`

## Create New Environment/Stage Deployment steps:

- `cd devops`
- `source ./env.sh $AWS_SLS_ENV sollet`
- `aws cloudformation create-stack --stack-name sollet-crypto-market-screener-com-$AWS_SLS_ENV --template-body file://static-site-stack.yaml --parameters ParameterKey=AcmCertificateArn,ParameterValue=$AWS_APP_ACMCERTIFICATEARN ParameterKey=SubDomain,ParameterValue=sollet ParameterKey=Environment,ParameterValue=$AWS_SLS_ENV`

## Remove Environment

1. Choose environment:

- dev
  1. `aws s3 rm s3://dev-sollet.cryptomarketscreener.com --recursive`
  2. `aws s3 rm s3://dev-sollet.cryptomarketscreener.com.analytics --recursive`
- prod
  1. `aws s3 rm s3://sollet.cryptomarketscreener.com --recursive`
  2. `aws s3 rm s3://sollet.cryptomarketscreener.com.analytics --recursive`

2. `aws cloudformation delete-stack --stack-name sollet-crypto-market-screener-com-$AWS_SLS_ENV`

# Client App Deployment

- `cd tmp`
- `git clone https://github.com/project-serum/spl-token-wallet.git`
- `cd spl-token-wallet`
- `yarn install`
- `yarn build`
  - dev
    1. `aws --profile default s3 sync build/ s3://dev-sollet.cryptomarketscreener.com`
  - prod
    1. `aws --profile default s3 sync build/ s3://sollet.cryptomarketscreener.com`
- Clear/Invalidate the AWS Cloudfront cache
- `source ./env-cloudfront.sh $AWS_SLS_ENV sollet`
- `aws cloudfront create-invalidation --distribution-id $AWS_CLOUDFRONT_DISTRIBUTION_ID --paths '/*'`
