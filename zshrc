#load zshuery
#git clone https://github.com/myfreeweb/zshuery.git
source $HOME/.zshuery/zshuery.sh
load_defaults
load_aliases
load_lol_aliases
load_completion $HOME/.zshuery/completion
load_correction

# disable svn completion
compdef -d svn

#update paths
export PATH="/usr/local/share/python:$HOME/.rbenv/bin:/usr/local/bin:$PATH"
export NODE_PATH="/usr/local/lib/node_modules"
export CLICOLOR=1

#rbenv
eval "$(rbenv init - zsh)"

#update editor
export EDITOR='vim'

function chpwd() {
    update_terminal_cwd
}

# make tab completion not so worthless when using cd:
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*' menu select

# make search up and down work, so partially type and hit up/down to find relevant stuff
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

#aliases
alias vim='mvim -v'
alias ll='ls -laG'
alias ls='ls -G'
alias http-serve='python -m SimpleHTTPServer 40001'

# Source trulia
source ~/.trulia

#git stuff simplified from oh-my-zsh
function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "git:${ref#refs/heads/}$(git_dirty)"
}

# Checks if working tree is dirty
function git_dirty() {
  if [[ -n $(git status -s --ignore-submodules=dirty 2> /dev/null) ]]; then
    #dirty
    echo "%{$fg[red]%}✗"
  else
    #clean
    echo ""
  fi
}

# Checks if there are commits ahead from remote
function git_prompt_ahead() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  if $(echo "$(git log origin/${ref#refs/heads/}..HEAD 2> /dev/null)" | grep '^commit' &> /dev/null); then
    echo "%{$fg_bold[green]%}+"
  fi
}

#set up prompt
if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="magenta"; fi
prompts '%{$fg[$NCOLOR]%}%c %{$fg[green]%}→ %{$reset_color%}' '%{$fg[purple]%}%p %{$fg[green]%}$(git_prompt_ahead)$(git_prompt_info)%{$reset_color%}'

#virtualenv helpers
function pyenv {
  if [ ! -d ~/.env/$1/ ]; then
    virtualenv ~/.env/$1 --no-site-packages
  fi
  source ~/.env/$1/bin/activate
}