# Profile startup performance
# zmodload zsh/zprof

eval "$(starship init zsh)"

export PATH=$PATH:"$HOMEBREW_PREFIX/bin"
export PATH=$PATH:"$HOMEBREW_PREFIX/sbin"
export PATH=$PATH:"$GOPATH/bin"
export PATH=$PATH:"$GOROOT/bin"
export PATH=$PATH:"$HOME/.pyenv/bin"
export PATH=$PATH:"$HOME/.poetry/bin"
export PATH=$PATH:"$HOME/.cargo/bin"
export PATH=$PATH:"$HOME/.surrealdb"
export PATH=$PATH:"$HOME/.local/share/flatpak/exports/bin"
export PATH=$PATH:"$LOCAL_BIN"
export PATH=$PATH:"$PYENV_ROOT/bin"
export PATH=$PATH:"$PYENV_ROOT/shims"

alias apt='nala'
alias ll='exa -l -g --icons --group-directories-first --octal-permissions --no-filesize --time-style long-iso --no-permissions --no-user'
alias la='ll -a'
alias gs='git status -s'
alias run='./run.sh'

eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
eval "$(direnv hook zsh)"
eval "$(atuin init zsh --disable-up-arrow)"

# Profile startup performance
# zprof
