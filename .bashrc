function command_not_found_handle {
		   printf "%s: η εντολή δε βρέθηκε\n" "$1" >&2
		   return 127
}

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# polyglot prompt
# download it
if [[ ! -f $HOME/polyglot.sh ]]; then
  wget https://raw.githubusercontent.com/agkozak/polyglot/master/polyglot.sh
fi
# source it
source $HOME/polyglot.sh

bind 'set show-mode-in-prompt off'

export MANROFFOPT='-c'
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2)
export LESS_TERMCAP_md=$(tput bold; tput setaf 1)
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4)
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
export LESS_TERMCAP_us=$(tput bold; tput setaf 2)
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)

trap 'echo -ne "\033]2;$(history 1 | sed "s/^[ ]*[0-9]*[ ]*//g")\007"' DEBUG

mkcd() { mkdir "$1"; cd "$1"; }

HISTSIZE=10000
HISTFILESIZE=50000

export IGNOREEOF=100

stty -ixon

HISTCONTROL=ignoredups

shopt -s histappend

shopt -s autocd

shopt -s cdspell

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -lh'
alias la='ls -lah'
alias termclock="tty-clock -b -c -C 6 -f \"%A %d/%m/%y\" -B -a 100000000 -d 0"

export LESS=-R

export MICRO_TRUECOLOR=1
