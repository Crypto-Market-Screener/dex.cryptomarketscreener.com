#!/bin/bash

# https://stackoverflow.com/questions/23793062/can-forks-be-synced-automatically-in-github


function deploy {
    echo "==> Deployment: $1"

    pushd ../serum/$1

    changed=0

    git remote update && git status -uno | grep -q 'Your branch is behind' && changed=1

    if [ $changed = 1 ]; then
        echo 'git pull'
        echo 'yarn install'
        echo 'yarn build'
        echo 's3 sync'
        echo 'cloudfront invalidate'

        echo "Updated successfully";
    else
        echo "Up-to-date"
    fi

    popd
}

deploy serum-dex-ui
deploy spl-token-wallet
