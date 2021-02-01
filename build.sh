#!/bin/sh

## setup build system and launch a build
##  output will be firmware binary and packages

# so github is recognized
ssh-keygen -F github.com || ssh-keyscan github.com >>~/.ssh/known_hosts

printf "> Starting build\n"
sh scripts/onion-feed-setup.sh
git checkout .config
if [[ ! -v BRANCH_NAME ]]; then
    echo "Checking out local folder"
    pushd feeds/oboo
    
    if git branch -r | grep $BRANCH_NAME; then
        git checkout $BRANCH_NAME
    fi
    popd
fi

# build
make -j 3


