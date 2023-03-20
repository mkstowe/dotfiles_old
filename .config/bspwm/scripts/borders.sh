#!/bin/sh
# Enable double borders
# Dependencies: chwb2 from wmutils/opt
#
# Yes, this is stolen from gk.

outer=$(xrdb -get background | cut -c2-)   # outer
inner1=$(xrdb -get color15 | cut -c2-)  # focused
inner2=$(xrdb -get color8 | cut -c2-)  # normal

trap 'bspc config border_width 0; kill -9 -$$' INT TERM

targets() {
    case $1 in
        focused) bspc query -N -n .focused.\!fullscreen;;
        normal)  bspc query -N -n .\!focused.\!fullscreen
    esac | grep -iv "$v"
}

bspc config border_width 18

draw() { chwb2 -I "$inner" -O "$outer" -i "4" -o "9" $* |:; }

# initial draw, and then subscribe to events
{ echo; bspc subscribe node_geometry node_focus; } |
    while read -r _; do
        [ "$v" ] || v='abcdefg'
        inner=$inner1 draw "$(targets focused)"
        inner=$inner2 draw "$(targets normal)"
        done
