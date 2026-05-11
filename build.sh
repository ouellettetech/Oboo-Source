#!/usr/bin/env bash
set -e
set -o pipefail

printf "> Starting build\n"

sh scripts/onion-feed-setup.sh

git checkout .config

if [[ -v BRANCH_NAME ]]; then
    echo "Checking out branch: $BRANCH_NAME"

    pushd feeds/oboo || exit 1

    if git branch -r | grep -q "origin/$BRANCH_NAME"; then
        git checkout "$BRANCH_NAME"
    fi

    popd
fi

make -j1 V=s 2>&1 | tee build.log