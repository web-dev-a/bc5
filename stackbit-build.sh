#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e940e7bcea34f001412182c/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e940e7bcea34f001412182c
curl -s -X POST https://api.stackbit.com/project/5e940e7bcea34f001412182c/webhook/build/ssgbuild > /dev/null
hugo
curl -s -X POST https://api.stackbit.com/project/5e940e7bcea34f001412182c/webhook/build/publish > /dev/null
