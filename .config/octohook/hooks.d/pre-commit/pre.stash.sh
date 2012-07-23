#!/bin/sh

set -e

# Public: Stash changes
stash_it() {
    git stash -q --keep-index
}

case "$1" in
    --about )
        echo "pre-commit octohook hook : stash changes"
        ;;
    * )
        stash_it
        ;;
esac
