#!/bin/sh

## setup build system and launch a build
##  output will be firmware binary and packages

# so github is recognized
cp -r sshKeys ~/.ssh
chown -R root ~/.ssh
ssh-keygen -F github.com || ssh-keyscan github.com >>~/.ssh/known_hosts

printf "> Starting build\n"
sh scripts/onion-feed-setup.sh
git checkout .config
if [[ ! -v PACKAGE_CHECKOUT ]]; then
    pushd feeds/oboo
    git checkout PACKAGE_CHECKOUT
    popd
fi

# build
make -j 3


