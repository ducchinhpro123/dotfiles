#!/usr/bin/env bash

# Stay hidden when no MPRIS-compatible player is available.
status=$(playerctl status 2>/dev/null) || exit 0

case "$status" in
    Playing) marker="▶" ;;
    Paused) marker="Ⅱ" ;;
    *) exit 0 ;;
esac

metadata=$(playerctl metadata --format '{{artist}} — {{title}}' 2>/dev/null) || exit 0

# Keep malformed metadata from being interpreted as Polybar formatting tags.
metadata=${metadata//$'\n'/ }
metadata=${metadata//%/%%}

printf '%s %s\n' "$marker" "$metadata"
