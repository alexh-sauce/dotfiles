if [ -f /usr/local/share/liquidprompt ]; then
  . /usr/local/share/liquidprompt
fi

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

GPG_AGENT_SOCKET=$HOME/.gnupg/S.gpg-agent
if [ ! -S "${GPG_AGENT_SOCKET}" ]; then
  gpg-agent --daemon >/dev/null 2>&1
  GPG_TTY=$(tty)
  export GPG_TTY
fi


test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Aliases
alias ll="ls -l"
alias grep='GREP_COLOR="1;37;41" LANG=C grep --color=auto'
