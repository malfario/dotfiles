### Paths
[[ -s $HOME/.pythonz/etc/bashrc ]] && source $HOME/.pythonz/etc/bashrc
# Hook for desk activation
[ -n "$DESK_ENV" ] && source "$DESK_ENV" || true

export PATH=$PATH:/usr/local/bin
export PIP_EXTRA_INDEX_URL=https://pypi.notin.net
