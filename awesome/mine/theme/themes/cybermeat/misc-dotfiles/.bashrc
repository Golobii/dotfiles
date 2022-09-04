#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ "$TERM" = "linux" ]; then
    _SEDCMD='s/.*\*color\([0-9]\{1,\}\).*#\([0-9a-fA-F]\{6\}\).*/\1 \2/p'
    for i in $(sed -n "$_SEDCMD" $HOME/.Xresources | awk '$1 < 16 {printf "\\e]P%X%s", $1, $2}'); do
        echo -en "$i"
    done
    clear
fi

alias ls='ls --color=auto'
PS1='[ \[\033[2;33m\]\A\[\033[0;37m\] ] \u\[\033[1;34m\]@\[\033[0;37m\]\h \[\033[1;34m\]`pwd`\[\033[0;37m\] > '
