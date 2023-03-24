#!/bin/sh

shift $((OPTIND-1))

word=$(xclip -o)
res=$(curl -s "https://api.dictionaryapi.dev/api/v2/entries/en_US/$word")
regex=$'"definition":"\K(.*?)(?=")'
definitions=$(echo "$res" | grep -Po "$regex")
separatedDefinition=$(sed ':a;N;$!ba;s/\n/\n\n/g' <<< "$definitions")
notify-send -t 15000 -a "word-lookup" "$word" "$separatedDefinition"
