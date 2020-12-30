set -Ux PYENV_ROOT $HOME/.pyenv
set -Ux fish_user_paths $PYENV_ROOT/bin $fish_user_paths

pyenv init - | source

set -Ux PYENV_VERSION 3.8.1

echo "TEST"
