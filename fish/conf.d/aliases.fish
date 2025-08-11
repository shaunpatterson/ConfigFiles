# Git aliases (based on your heavy git usage)
alias g='git'
alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit -a -m'
alias gp='git push'
alias gpu='git push -u origin (git branch --show-current)'
alias gl='git pull'
alias glog='git log --oneline --graph --decorate'
alias gd='git diff'
alias gds='git diff --staged'
alias gb='git branch'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gst='git stash'
alias gstp='git stash pop'
alias gf='git fetch'
alias gr='git rebase'
alias gri='git rebase -i'
alias gitpush='git add . && git commit -m "Quick commit" && git push'

# Docker aliases
alias d='docker'
alias dc='docker-compose'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dimg='docker images'
alias dcu='docker-compose up'
alias dcud='docker-compose up -d'
alias dcd='docker-compose down'
alias dcr='docker-compose restart'
alias dex='docker exec -it'
alias dlog='docker logs -f'
alias dprune='docker system prune -a'

# Python/Development
alias py='python'
alias py3='python3'
alias pip='pip3'
alias pv='pyenv versions'
alias venv='python -m venv .venv'
alias activate='source .venv/bin/activate.fish'
alias uvr='uv run'
alias uvs='uv sync'
alias uva='uv add'

# File operations
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'
alias lt='ls -ltra'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias mkd='mkdir -pv'
alias rmf='rm -rf'
alias cpv='cp -v'
alias mvv='mv -v'

# Process management
alias psg='ps aux | grep'
alias k9='kill -9'
alias ports='lsof -i -P -n'
alias listen='lsof -i -P -n | grep LISTEN'
alias port='lsof -i :'

# System
alias h='history'
alias c='clear'
alias q='exit'
alias reload='source ~/.config/fish/config.fish'
alias fishconfig='vi ~/.config/fish/config.fish'
alias fishaliases='vi ~/.config/fish/conf.d/aliases.fish'

# Enhanced commands
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias df='df -h'
alias du='du -h'
alias free='free -h'
alias top='htop'

# Quick navigation to common directories
alias workspace='cd ~/workspace'
alias downloads='cd ~/Downloads'
alias docs='cd ~/Documents'

# NPM shortcuts
alias ni='npm install'
alias nid='npm install --save-dev'
alias nr='npm run'
alias nrd='npm run dev'
alias nrb='npm run build'
alias nrt='npm run test'
alias nstart='npm start'

# Make commands
alias m='make'
alias mc='make clean'
alias mi='make install'
alias mb='make build'

# Safety nets
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I --preserve-root'
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# Quick file viewing
# alias cat='bat --style=plain'  # Uncomment if bat is installed
alias less='less -R'
alias head='head -n 20'
alias tail='tail -n 20'
alias tailf='tail -f'