#!/bin/sh

command -v xset >/dev/null || exit 0

# Keyboard: shorter delay before repeat, faster repeat rate
xset r rate 200 40

# Mouse: moderate acceleration for quicker cursor movement
xset m 2 1

# Disable PC speaker beep
xset -b