#!/bin/bash

readonly PROJECT="PESimu-Select"
readonly VERSION="$1"
readonly TAG_LABEL=${PROJECT}-v${VERSION}

git tag -f -a $TAG_LABEL -m 'version $version'
git push -f --tags
