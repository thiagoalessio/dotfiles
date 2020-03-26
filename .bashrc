#!/usr/bin/env bash
# vi:ft=sh:fdl=0:fdm=expr:fde=v\:lnum<12?0\:(getline(v\:lnum)=~'^\\s*$'&&getline(v\:lnum+1)=~'\\S'?'<1'\:1):
#
#    ░░░░░░   ░░░░░  ░░░░░░░ ░░   ░░ ░░░░░░   ░░░░░░
#    ▒▒   ▒▒ ▒▒   ▒▒ ▒▒      ▒▒   ▒▒ ▒▒   ▒▒ ▒▒
#    ▓▓▓▓▓▓  ▓▓▓▓▓▓▓ ▓▓▓▓▓▓▓ ▓▓▓▓▓▓▓ ▓▓▓▓▓▓  ▓▓
#    ██   ██ ██   ██      ██ ██   ██ ██   ██ ██
# ██ ██████  ██   ██ ███████ ██   ██ ██   ██  ██████
#
# @author: thiagoalessio <thiagoalessio@me.com>
# @url: https://github.com/thiagoalessio/dotfiles

# custom functions
load() { test -f "${1}" && . "${1}"; }
buildvm() { ssh -K -L 8888:localhost:8443 buildvm.openshift.eng.bos.redhat.com; }

# source global definitions
load /etc/bashrc

# environment
load "${HOME}/.asdf/asdf.sh"
load "${HOME}/.asdf/plugins/java/set-java-home.sh"
export PATH="${HOME}/.local/bin:${HOME}/bin:${PATH}"
export EDITOR=vim
export PAGER=less
export REQUESTS_CA_BUNDLE=/etc/pki/tls/certs/ca-bundle.crt
export LS_COLORS="ow=01;94:di=01;94"
export GREP_COLORS='ms=07;33'

# completions
load "${HOME}/.local/src/brew-koji/bash/brew-koji"
load "${HOME}/.local/src/password-store/src/completion/pass.bash-completion"
load "${HOME}/.asdf/completions/asdf.bash"

# prompt
load /usr/share/git-core/contrib/completion/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
PS1='\n\[\e[1;30m\]\t\[\e[0m\] '
PS1="${PS1}\[\e[31m\]\$(rc=\$?; [[ \$rc -ne 0 ]] && echo '('\$rc')')\[\e[0m\]\n"
PS1="${PS1}\$(__git_ps1 '\[\e[35m\](%s)\[\e[0m\] ')"
PS1="${PS1}\w \$ "
export PS1

# aliases
alias brew='koji'
alias docker='podman'
alias kinit_redhat='kinit talessio@IPA.REDHAT.COM'
alias kinit_fedora='kinit thiagoalessio@FEDORAPROJECT.ORG'
alias ls='ls -a --color'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias tmux='tmux -2u'
alias tree='tree -a'
alias vi='vim'

# base16-shell
test -z "${SSH_CONNECTION}" && {
	profile_helper="${HOME}/.config/base16-shell/profile_helper.sh"
	test -s "${profile_helper}" && eval "$("${profile_helper}")"
}
base16_outrun-dark 2>/dev/null || true

# tmux
test -z "${SSH_CONNECTION}" && test -z "${TMUX}" && {
	session=default
	tmux new-session -t "${session}" || tmux new-session -s "${session}"
}
