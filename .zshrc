## ----------- antigen ----------- ##
source "$HOME/.antigen.zsh"
antigen init ~/.antigenrc

## ----------- basic stuff ----------- ##
bindkey -e # emacs bindings

## ----------- path stuff ----------- ##
export PATH=$HOME/bin:/usr/local/bin:$PATH

# add LaTeX
export PATH=$PATH:/usr/local/texlive/2016basic/bin/x86_64-darwin/:/usr/texbin

# add miniconda 
export PATH="$HOME/miniconda3/bin:$PATH"

## ----------- custom aliases ----------- ##
alias ll="ls -larth"
alias df="df -h"
alias du="du -h"
alias grep="grep --color"
alias today="date +%F"
alias gl="git pull --rebase"
alias g=git
alias h=brew
alias c=conda

alias pip=pip3
alias pythin=python3

export EDITOR=nvim
# alias vim to neovim and old vim to shitvim
alias vim=nvim

## ----------- custom aliases ----------- ##

# this is for opening up jupyter lab instances in chrome
app() {
  /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --app="$1"
}

## ----------- history stuff ----------- ##
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=5000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

## ----------- autocompletetion ----------- ##
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
