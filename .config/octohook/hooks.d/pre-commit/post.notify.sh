#!/bin/sh

set -e

# Public: Unstash changes
notify_it() {
    command -v notify-send 1>/dev/null && {
        NOTIFY_TITLE="Octohook"
        NOTIFY_TEXT="Hooks pre-commit runs fine. You rocks \!"
        NOTIFY_ICON="face-smile"
        if test $1 -gt 0; then
            NOTIFY_TEXT="Hooks pre-commit have failed. Damned \!"
            NOTIFY_ICON="face-uncertain"
        fi
        notify-send -i $NOTIFY_ICON "$NOTIFY_TITLE" "$NOTIFY_TEXT"
    }
}

case "$1" in
    --about )
        echo "pre-commit octohook hook : notify using notify-send"
        ;;
    * )
        notify_it $*
        ;;
esac
