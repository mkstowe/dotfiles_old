# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

zstyle ':omz:update' mode auto      # update automatically without asking

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

source $ZSH/oh-my-zsh.sh

# autoload -U promptinit; promptinit

source ~/.zplug/init.zsh

zplug "MikeDacre/careful_rm"
zplug "clvv/fasd"
zplug "romkatv/powerlevel10k", as:theme, depth:1
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
zplug "plugins/frontend-search", from:oh-my-zsh
zplug "plugins/ng", from:oh-my-zsh
zplug "plugins/nvm", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/rg", from:oh-my-zsh
zplug "plugins/safe-paste", from:oh-my-zsh
zplug "plugins/ubuntu", from:oh-my-zsh
zplug "plugins/web-search", from:oh-my-zsh

if ! zplug check --verbose; then
	printf "Install? [y/N]: "
	if read -q; then
		echo; zplug install
	fi
fi
							
zplug load
							
source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(fasd --init auto)"

export PATH=$PATH:$HOME/.local/bin
export PROJECT_HOME=$HOME/projects

alias ez='nvim ~/.zshrc'
alias suez='sudo nvim ~/.zshrc'

alias po='poweroff'
alias sudo='sudo '
alias ag='acs -g'

alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gA='git add --all'
alias gd='git add .'
alias gpush='push'
alias gpull='pull'
alias gc='send'

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
alias dpull='yadmPull'
alias dpush='yadmPush'
alias da='yadm add'
alias dA='yadm add -u'
alias daa='yadm add -u'
alias dc='yadmSend'

yadmPull() {
  if [ $# -eq 2 ]; then
    yadm pull --rebase -q $2 "$(yadm rev-parse --abbrev-ref HEAD)"
  else
    yadm pull --rebase -q origin "$(yadm rev-parse --abbrev-ref HEAD)"
  fi
}

yadmPush() {
  if [ $# -eq 2 ]; then
    yadm push -q $2 "$(yadm rev-parse --abbrev-ref HEAD)"
  else
    yadm push -q origin "$(yadm rev-parse --abbrev-ref HEAD)"
  fi
}

yadmSend() {
  yadm submodule update --remote --merge
  yadm add -u
  if [ $# -eq 1 ]; then
    yadm commit -a -m "$1"
  else
    yadm commit -a -m "I'm too lazy to write a commit message."
  fi
  yadmPull
  yadmPush
}

alias npmi='npm i'
alias ni='npm i'
alias npmg='npm i -g'
alias npmr='npm run'
alias npmd='npm i -D'

alias uu='sudo pacman -Syu'
alias ls='ls -Fsh1 --color=auto'
alias lsa='ls -AFsh1 --color=auto'
alias lsl='ls -AFosh1 --color=auto'
alias showip='hostname -i'

alias rm='careful_rm -c'
alias mv='mv -vi'
alias cp='cp -vi'

alias venv='source env/bin/activate'
alias q='exit'
alias :q='exit'
alias c='clear'
alias pd='pwd'

alias h='history'
alias hg='history | grep'

mdc() {
	mkdir $1 && cd $1
}

alias loadz='source ~/.zshrc'
alias loadzsh='source ~/.zshrc'
alias loadx='xrdb ~/.Xresources'

alias bun="~/bin/bunnyfetch.sh"

alias vim='nvim'
alias vi='nvim'
alias v='f -e nvim'

alias code='code-insiders'

savepac () {
	pacman -Qet | awk {'print $1'} > ~/Documents/pacman_list.txt
}

# Load Angular CLI autocompletion.
source <(ng completion script)
source /usr/share/nvm/init-nvm.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval $(thefuck --alias)
