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

alias aoeu="xmodmap /usr/share/xmodmap/xmodmap.us"				#-- Switches from dvorak back to standard
alias asdf="xmodmap /usr/share/xmodmap/xmodmap.dvorak"			#-- Switches from standard to dvorak


export PATH=/usr/local/bin/:$PATH
export PATH=~/.vim/sessions/:$PATH

export PATH=~/scripts:$PATH

export GIT_COMMITTER_EMAIL="shaunpatterson@gmail.com"
export GIT_COMMITTER_NAME="Shaun Patterson"
export GIT_AUTHOR_EMAIL="shaunpatterson@gmail.com"
export GIT_AUTHOR_NAME="Shaun Patterson"

export PATH=/home/shaun/Download/android-sdk-linux_x86/tools/:$PATH
export PATH=/usr/java/latest/bin:$PATH

export PATH=~/bin:$PATH

source /Users/pattersons1/Developer/anthroweb/env-config

alias aw='cd ~/Developer/anthroweb'

export URBNWEB_ROOT=~/Developer/URBNweb/urbnweb
export BASE_ROOT=~/Developer/URBNweb/urbnweb

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).


function a {
    cd ~/Developer/ANCom
    title ANCom
    source venv/bin/activate
}


function u {
    cd ~/Developer/URBNWeb
    title URBNWeb
    source venv/bin/activate
}

function title {
    echo -ne "\033]0;"$*"\007"
}

