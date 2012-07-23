#!/bin/sh

set -e

# Public: Unstash changes
unstash_it() {
    git stash pop -q
}

case "$1" in
    --about )
        echo "pre-commit octohook hook : unstash changes"
        ;;
    * )
        unstash_it
        ;;
esac

