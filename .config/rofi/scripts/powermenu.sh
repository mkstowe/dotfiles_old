#!/usr/bin/env sh
#
# A rofi powered menu to execute power related action.

power_off=''
reboot=''
lock=''
suspend='鈴'
log_out=''

chosen=$(printf '%s;%s;%s;%s;%s\n' "$power_off" "$reboot" "$lock" "$suspend" \
                                   "$log_out" \
    | rofi -theme-str '@import "~/.config/rofi/powermenu.rasi"' \
           -dmenu \
           -sep ';' \
           -selected-row 0)

case "$chosen" in
    "$power_off")
        $(~/.config/rofi/scripts/rofi-prompt --query 'Shutdown?') && poweroff
        ;;

    "$reboot")
        $(~/.config/rofi/scripts/rofi-prompt --query 'Reboot?') && reboot
        ;;

    "$lock")
        # TODO Add your lockscreen command.
        ;;

    "$suspend")
        # TODO Add your suspend command.
        ;;

    "$log_out")
        # TODO Add your log out command.
        ;;

    *) exit 1 ;;
esac

