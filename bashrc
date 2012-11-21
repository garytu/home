[ -z "$PS1" ] && return
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
export EDITOR=vim

alias wine32="env WINEARCH=win32 WINEPREFIX=~/.wine32 wine"
alias winetricks32="env WINEARCH=win32 WINEPREFIX=~/.wine32 winetricks"
#export XAUTHORITY=/home/garytu/.Xauthority


xhost +SI:localuser:root > /dev/null
xhost +SI:localuser:garytu > /dev/null

export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

export P4PORT=dpapp04.tw.ibm.com:1666
export P4CONFIG=.p4config
export P4USER=garytu
export P4DIFF="diff -u"


if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi
