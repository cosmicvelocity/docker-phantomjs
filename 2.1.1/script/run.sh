#!/usr/bin/env bash
#
# Run phantomjs in a container
#
# This script will attempt to mirror the host paths by using volumes for the
# following paths:
#   * $(pwd)
#   * $HOME if it's set
#

set -e

VERSION="2.1.1"
IMAGE="cosmicvelocity/phantomjs:$VERSION"

if [ "$(pwd)" != '/' ]; then
    VOLUMES="-v $(pwd):$(pwd)"
fi

if [ -n "$HOME" ]; then
    VOLUMES="$VOLUMES -v $HOME:$HOME -v $HOME:/root"
fi

exec docker run --rm $VOLUMES -w "$(pwd)" $IMAGE "$@"
