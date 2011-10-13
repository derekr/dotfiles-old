source ~/.colors

PS1='\[$green\]\W \[$purple\]→\[$reset_color\] '

export PATH=/usr/local/bin:$PATH
export NODE_PATH=/usr/local/lib/node_modules:$NODE_PATH

alias vim='mvim -v'
alias ll='ls -la'

# Trulia
alias fedev='ssh dreynolds@fedev.utah.trulia.com'
alias synccobrand='rsync -avz ~/Documents/Trulia/public_html/cobrand_merge/ dreynolds@fedev.utah.trulia.com:/home/dreynolds/public_html/cobrand_merge/ --exclude ".svn"'
alias synccommon='rsync -avz ~/Documents/Trulia/svn/common/ dreynolds@fedev.utah.trulia.com:/home/dreynolds/svn/common/ --exclude ".svn"'
