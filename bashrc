if [[ $(hostname) == "UOIANShatterson.urbanout.com" ]]; then
    export PS1="[\u@mac \W] "
else
    export PS1="[\u@\h \W] "
fi

alias xterm="xterm -bg DarkBlue -fg snow"
alias tree="tree -C"
alias rm="rm -i "
alias cp="cp -i " 
alias vi="vim"
alias gvim="vim -g"


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


alias aw='cd ~/Developer/anthroweb'

export URBNWEB_ROOT=~/Developer/URBNweb/urbnweb
export URBNWEB_QA_ROOT=/Users/pattersons1/Developer/URBNWeb/urbnweb
export BASE_ROOT=~/Developer/URBNweb/urbnweb

alias cleanup_branches='git branch --merged | egrep -v "\*|master|dev" | xargs -n 1 git branch -d'

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

export STUDIO_JDK=/Library/Java/JavaVirtualMachines/jdk1.8.0_66.jdk

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
export PATH="$HOME/.jenv/bin:$PATH"

export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$HOME/n/bin:$PATH"
eval "$(pyenv init -)"

function a {
    cd ~/Developer/ANCom
    title ANCom
    source venv/bin/activate
}

function b {
    cd ~/Developer/WLCom
    title WLCom
    source venv/bin/activate
}

function o {
    cd ~/Developer/UOCom
    title UOCom
    source ~/Developer/UOCom/venv/bin/activate
}

function u {
    cd ~/Developer/URBNWeb
    title URBNWeb
    source ~/Developer/ANCom/venv/bin/activate
}

function f {
    cd ~/Developer/FPCommon
    title FP
    source ~/Developer/FPCommon/venv/bin/activate
}

function r {
    cd ~/workspace/rg-apps/email_service
    title RG
    ./mac_venv.sh
}

function p {
    cd ~/workspace/rg-apps/paphub
    title PH
    source ~/workspace/rg-apps/paphub/venv/bin/activate
}

function g {
    cd ~/Developer/groundhog-engine
}




function title {
    echo -ne "\033]0;"$*"\007"
}

 defaults write -g InitialKeyRepeat -int 8
 defaults write -g KeyRepeat -int 1

export PATH=$PATH:~/go/bin

 export UDACITY_AUTH_TOKEN=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo5Mjc3MSwiZXhwIjoxNDkzNTgxMDg1LCJ0b2tlbl90eXBlIjoiYXBpIn0.neU0xfRbXhOK7B-VpHQlmrYP-ypACcYA1uNQ5bywe-o
