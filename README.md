## [dex.cryptomarketscreener.com](https://dex.cryptomarketscreener.com)

## [sollet.cryptomarketscreener.com](https://sollet.cryptomarketscreener.com)

## Overview

Create AWS S3 and Cloudfront Static Sites for:

1. The Serum DEX Client UI.
2. Solana SPL Token Wallet (Sollet)

Clone and deploy the UI code to a sub-domain of a domain hosted on AWS Route 53 (examples below):

1. [dex.cryptomarketscreener.com](https://dex.cryptomarketscreener.com)
1. [sollet.cryptomarketscreener.com](https://sollet.cryptomarketscreener.com)

This application is build around the UNIX command line.

## Requirements

- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)
- [Node JS](https://nodejs.org/en/download/)
- [jq](https://stedolan.github.io/jq/)
- A domain name hosted with AWS Route 53 and with a Certificate enabled in the us-east-1 region (for Cloudfront https)

The following setup instructions are configurable to your own domain name via Cloudfront template variables

- [README-DEX.md](README-DEX.md)
- [README-WALLET.md](README-WALLET.md)

## To Do

Deployment is a manual process, from your workstation or server to AWS - a automated CI/CD pipeline will be developed.
