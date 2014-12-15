#load zshuery
#git clone https://github.com/myfreeweb/zshuery.git
source $HOME/.zshuery/zshuery.sh
load_defaults
load_aliases
load_lol_aliases
load_completion $HOME/.zshuery/completion
load_correction

source ~/.zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# diy subcommands
eval "$(/usr/local/diy/bin/diy init -)"

# disable svn completion
compdef -d svn

#update paths
export PATH="/usr/local/share/npm/bin:/usr/local/share/python:$HOME/.rbenv/bin:/usr/local/bin:/usr/local/php5/bin:/usr/local/packer:$PATH"
export NODE_PATH="/usr/local/lib/node_modules"
export CLICOLOR=1

#nvm
[[ -s /Users/drk/.nvm/nvm.sh ]] && . /Users/drk/.nvm/nvm.sh  # This loads NVM

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
alias vi='vim'
alias ll='ls -laG'
alias ls='ls -G'
alias ldir='for i in *; if [ -d $i ]; then echo $i; fi;'
alias http-serve='python -m SimpleHTTPServer 40001'
alias c='pygmentize -O style=monokai -f console256 -g'
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

alias s='svn'

alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

#type -t md5sum > /dev/null || alias md5sum="md5"

alias g="git"

alias fs="stat -f \"%z bytes\""

alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

alias isim="open /Applications/Xcode.app/Contents/Applications/iOS\ Simulator.app"

# Source diy
if [ -f ~/.diy ]
then
  source ~/.diy
fi

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

#virtualenv wrapper
#export WORKON_HOME=~/.envs
#source /usr/local/share/python/virtualenvwrapper.sh

function mkc () {
  mkdir -p "$@" && cd "$@"
}

# extract archives -- usage: extract </path/to/archive/>
extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2) tar xjf $1 ;;
      *.tar.gz) tar xzf $1 ;;
      *.bz2) bunzip2 $1 ;;
      *.rar) unrar e $1 ;;
      *.gz) gunzip $1 ;;
      *.tar) tar xf $1 ;;
      *.tbz2) tar xjf $1 ;;
      *.tgz) tar xzf $1 ;;
      *.zip) unzip "$1" ;;
      *.Z) uncompress $1 ;;
      *.7z) 7z x $1 ;;
      *) echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
