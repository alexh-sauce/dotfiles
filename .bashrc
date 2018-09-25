if [ -f /usr/local/share/liquidprompt ]; then
  . /usr/local/share/liquidprompt
fi

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export CLICOLOR=true
export LSCOLORS=gxgxcxdxbxegedabagacad

# Homebrew binaries and scripts before system ones
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/opt/ruby/bin:$PATH

PATH=$PATH:$HOME/bin:$HOME/go/bin:$HOME/Library/Python/3.7/bin

# pip bash completion start
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip
# pip bash completion end

GPG_AGENT_SOCKET=$HOME/.gnupg/S.gpg-agent
if [ ! -S "${GPG_AGENT_SOCKET}" ]; then
  gpg-agent --daemon >/dev/null 2>&1
  GPG_TTY=$(tty)
  export GPG_TTY
fi

tunnels() {
	curl -sS -u "${SAUCE_USERNAME}:${SAUCE_ACCESS_KEY}" "https://saucelabs.com/rest/v1/${SAUCE_USERNAME}/tunnels"
}

get_tunnel() {
	local tunnel_id=$1
	curl -sS -u "${SAUCE_USERNAME}:${SAUCE_ACCESS_KEY}" "https://saucelabs.com/rest/v1/${SAUCE_USERNAME}/tunnels/${tunnel_id}"
}

delete_tunnel() {
	local tunnel_id=$1
	curl -sS -u "${SAUCE_USERNAME}:${SAUCE_ACCESS_KEY}" -X DELETE "https://saucelabs.com/rest/v1/${SAUCE_USERNAME}/tunnels/${tunnel_id}"
}

kube-env() {
	eval $(minikube docker-env)
}

docker-env() {
	eval $(docker-machine env -u)
}

gclone() {
  repo=${1}
  org_name=$(basename "$(dirname "${repo/git@*:/}")")
  mkdir -p "${HOME}/repos/${org_name}"
  cd "${HOME}/repos/${org_name}" || return
  git clone "${repo}"

  # Strip .git
  cd "$(basename "${repo/.git/}")" || return
}

qpass() {
  site=$1

  DISPLAY=:0 pass show -q1 "${site}"
}

websrv() {
  make -C /Users/alexharford/test_code/html
}

techtalk() {
	talk=$1

	curl --referer https://wiki.saucelabs.com/display/AD/Sauce+Labs+Tech+Talks "${talk}"
}

# Aliases
alias ll="ls -l"
alias grep='GREP_COLOR="1;37;41" LANG=C grep --color=auto'

source .sauce.env
