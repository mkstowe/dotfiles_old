#!/bin/bash
# Tiny colored fetch script
# based on elenapan/bunnyfetch @ github
# modified by mkstowe @ github

f=3 b=4
for j in f b; do
  for i in {0..7}; do
    printf -v $j$i %b "\e[${!j}${i}m"
  done
done
d=$'\e[1m'
t=$'\e[0m'
v=$'\e[7m'

# Items
sep=
s=$d$f0$sep$t

me="$USER$f5@$t$(hostname)"
separator="------------"
os="$(grep PRETTY_NAME /etc/os-release | awk -F = '{ print $2 }' | sed -e 's/\"//g')"
wmname="$(xprop -id $(xprop -root -notype | awk '$1=="_NET_SUPPORTING_WM_CHECK:"{print $5}') -notype -f _NET_WM_NAME 8t | grep "WM_NAME" | cut -f2 -d \")"
kernel="$(uname -r | cut -d '-' -f1)"
resolution="$(xwininfo -root | grep geometry | awk '{print $2}' | cut -d + -f1)"
shell=$(basename $SHELL)
term=$(pstree -sA $$ | awk -F "---" '{ print $2 }')

c0='[0m';
c1='[31m'; c2='[32m'
c3='[33m'; c4='[34m'
c5='[35m'; c6='[36m'
c7='[37m'; c8='[38m'
palette="[7m$c1 $c1 $c1 $c2 $c2 $c2 $c3 $c3 $c3 $c4 $c4 $c4 $c5 $c5 $c5 $c6 $c6 $c6 [m"

# (\ /)
# ( · ·)
# c(")(")

# (\ /)
# ( . .)
# c(")(")

tput clear
cat << EOF

              $me
              $f5$separator
   $t(\ /)      $os
   ( $d. .$t)     $wmname 
   c($f5"$t)($f5"$t)    $shell
   $f2~~~~~~~~~  $t$term

    $palette
EOF
