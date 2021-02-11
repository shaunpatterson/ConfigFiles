if [ "$(uname)" == "Darwin" ]; then
    alias ls="gls --color=always"
    eval `gdircolors ~/.dir_colors`
else
    alias ls="ls -G"
    eval `dircolors ~/.dir_colors`
fi

export PATH=/usr/local/bin/:$PATH
export PATH=~/.vim/sessions/:$PATH

export PATH=~/scripts:$PATH

export GIT_COMMITTER_EMAIL="shaunpatterson@gmail.com"
export GIT_COMMITTER_NAME="Shaun Patterson"
export GIT_AUTHOR_EMAIL="shaunpatterson@gmail.com"
export GIT_AUTHOR_NAME="Shaun Patterson"

export PATH=~/bin:$PATH

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi



