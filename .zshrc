# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="robbyrussell"

zstyle ':omz:update' mode auto      # update automatically without asking

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

source $ZSH/oh-my-zsh.sh

fpath+=$HOME/.zsh/pure

autoload -U promptinit; promptinit

zstyle :prompt:pure:git:branch color cyan
zstyle :prompt:pure:git:action color cyan
zstyle :prompt:pure:host color cyan
zstyle :prompt:pure:prompt:continuation color cyan
zstyle :prompt:pure:user color cyan
prompt pure

source ~/.zplug/init.zsh

zplug "MikeDacre/careful_rm"
zplug "Bhupesh-V/ugit"
zplug "peterhurford/up.zsh"
zplug "MichaelAquilina/zsh-auto-notify"
zplug "hlissner/zsh-autopair", defer:2
zplug "ianthehenry/zsh-autoquoter"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zdharma-continuum/fast-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search", defer:2
zplug "jeffreytse/zsh-vi-mode"
zplug "MichaelAquilina/zsh-you-should-use"

zplug "plugins/aliases", from:oh-my-zsh
zplug "plugins/archlinux", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/colorize", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/copybuffer", from:oh-my-zsh
zplug "plugins/copydir", from:oh-my-zsh
zplug "plugins/copyfile", from:oh-my-zsh
zplug "plugins/cp", from:oh-my-zsh
zplug "plugins/dirhistory", from:oh-my-zsh
zplug "plugins/extract", from:oh-my-zsh
zplug "plugins/man", from:oh-my-zsh
zplug "plugins/nvm", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/safe-paste", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/systemd", from:oh-my-zsh
zplug "plugins/ubuntu", from:oh-my-zsh

if ! zplug check --verbose; then
	printf "Install? [y/N]: "
	if read -q; then
		echo; zplug install
	fi
fi
							
zplug load
							
source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(zoxide init zsh)"

export PATH=$PATH:$HOME/.local/bin
export PROJECT_HOME=$HOME/projects

alias ez='nvim ~/.zshrc'
alias suez='sudo nvim ~/.zshrc'

alias po='poweroff'
alias sudo='sudo '

alias gs='git status'
alias ga='git add -A'
alias gpush='git push'
alias gpull='git pull'

pull() {
  if [ $# -eq 2 ]; then
    git pull --rebase -q $2 "$(git rev-parse --abbrev-ref HEAD)"
  else
    git pull --rebase -q origin "$(git rev-parse --abbrev-ref HEAD)"
  fi
}

push() {
  if [ $# -eq 2 ]; then
    git push -q $2 "$(git rev-parse --abbrev-ref HEAD)"
  else
    git push -q origin "$(git rev-parse --abbrev-ref HEAD)"
  fi
}

send() {
  git add "$(git rev-parse --show-toplevel)"
  if [ $# -eq 1 ]; then
    git commit -a -m "$1"
  else
    git commit -a -m "I'm too lazy to write a commit message."
  fi
  pull
  push
}

alias ds='yadm status'
alias dpull='yadm pull'
alias dpush='yadm push'
alias da='yadm add -u'
alias dc='yadm commit -m'

alias npmi='npm i'
alias ni='npm i'
alias npmg='npm i -g'
alias npmr='npm run'
alias npmd='npm i -D'

alias uu='sudo pacman -Syu'
alias ls='ls -Fsh1 --color=auto'
alias lsa='ls -AFsh1 --color=auto'
alias lsl='ls AFosh1 --color=auto'
alias showip='hostname -I'
alias rm='careful_rm -c'

alias venv='source env/bin/activate'
alias q='exit'
alias c='clear'
alias pd='pwd'

alias h='history'
alias hg='history | grep'
alias ag='alias | grep'

mdc() {
	mkdir $1 && cd $1
}

alias loadz='source ~/.zshrc'
alias loadzsh='source ~/.zshrc'
alias loadx='xrdb ~/.Xresources'

alias nf='neofetch'
alias fortune='clear && fortune -s | python /home/mkstowe/.local/bin/fortune-cat -p 1 -mtl 35'
alias bun='~/.local/bin/bunnyfetch'

alias vim='nvim'
alias vi='nvim'
alias v='nvim'

alias code='code-insiders'

savepac () {
	pacman -Qet | awk {'print $1'} > ~/Documents/pacman_list.txt
}

# Load Angular CLI autocompletion.
source <(ng completion script)
source /usr/share/nvm/init-nvm.sh
