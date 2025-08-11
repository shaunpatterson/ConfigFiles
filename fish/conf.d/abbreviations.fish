# Fish abbreviations - expand as you type
# These are better than aliases for interactive use

# Git abbreviations
abbr -a gits 'git status'
abbr -a gitd 'git diff'
abbr -a gitl 'git log'
abbr -a gitp 'git push'
abbr -a gitpl 'git pull'
abbr -a gitc 'git commit'
abbr -a gita 'git add'

# Common typos
abbr -a sl 'ls'
abbr -a dc 'cd'
abbr -a sduo 'sudo'
abbr -a suod 'sudo'
abbr -a gti 'git'
abbr -a got 'git'
abbr -a gut 'git'

# Quick commands
abbr -a e 'echo'
abbr -a s 'sudo'
abbr -a v 'vi'
abbr -a t 'touch'
abbr -a m 'make'
abbr -a x 'exit'

# System info
abbr -a sysinfo 'uname -a && lsb_release -a'
abbr -a meminfo 'free -h'
abbr -a cpuinfo 'lscpu'
abbr -a diskinfo 'df -h'

# Network
abbr -a myip 'curl -s https://api.ipify.org && echo'
abbr -a localip 'hostname -I'
abbr -a speedtest 'curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'

# Date/Time
abbr -a now 'date +"%Y-%m-%d %H:%M:%S"'
abbr -a today 'date +"%Y-%m-%d"'
abbr -a timestamp 'date +%s'

# Quick edits
abbr -a hosts 'sudo vi /etc/hosts'
abbr -a bashrc 'vi ~/.bashrc'
abbr -a gitconfig 'vi ~/.gitconfig'

# Docker compose shortcuts
abbr -a dcu 'docker-compose up'
abbr -a dcud 'docker-compose up -d'
abbr -a dcd 'docker-compose down'
abbr -a dcl 'docker-compose logs'
abbr -a dclf 'docker-compose logs -f'
abbr -a dcps 'docker-compose ps'
abbr -a dcr 'docker-compose restart'
abbr -a dcb 'docker-compose build'

# Python
abbr -a pipreqs 'pip freeze > requirements.txt'
abbr -a pipinstall 'pip install -r requirements.txt'
abbr -a pytest 'python -m pytest'
abbr -a pyserve 'python -m http.server'

# Common patterns
abbr -a -- '--help' ' --help | less'
abbr -a findfile 'find . -name'
abbr -a finddir 'find . -type d -name'
abbr -a biggest 'du -h | sort -rh | head -20'
abbr -a diskusage 'ncdu'
abbr -a weather 'curl wttr.in'