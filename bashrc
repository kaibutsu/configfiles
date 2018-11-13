#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PROMPT_COMMAND="dbus-send --type=method_call --session --dest=net.launchpad.pantheon-terminal /net/launchpad/pantheon_terminal org.pantheon.terminal.ProcessFinished string:$PANTHEON_TERMINAL_ID string:"$(history 1 | cut -c 8-)" >/dev/null 2>&1;"

source /usr/share/git/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export PROMPT_DIRTRIM=4
export PS1='\[\033[0;33m\]$(declare -F __git_ps1 &>/dev/null && __git_ps1 "(%s) ")\[\033[0;00m\]\u@\h \[\033[0;32m\]\w\[\033[0;00m\] \$ '

# setting preferred options on ls
alias ls='ls -hF --color=auto'
alias l='ls -al'

# prompt user if overwriting during copy
alias cp='cp -i'

# Disable "rm" in favor of trash-cli...
alias rm='echo "\"rm\" disabled, use \"trash-put\" or \"trp\" instead."; false'
alias trp="trash-put"

# always print in human readable form
alias df="df -h"

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

## source /etc/profile.d/vte.sh to enable opening terminal in current folder
source /etc/profile.d/vte.sh
