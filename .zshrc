# Set up the prompt
eval "$(starship init zsh)"

setopt histignorealldups sharehistory

# Use vi keybindings
bindkey -v

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=5000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

alias ll='exa -l -g --icons'
alias lla='ll -a'
alias gs='git status -s'
alias n='nvim .'
alias repo="git remote -v | awk 'NR==1 {print $2}' | cut -d ':' -f 2 | cut -d '.' -f 1"

export PYENV_ROOT="$HOME/.pyenv"
export PIPX_DEFAULT_PYTHON="$PYENV_ROOT/versions/3.10.5/bin/python"
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:'/usr/lib/x86_64-linux-gnu/pkgconfig'
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:'/usr/share/pkgconfig'
export BAT_THEME='Nord'
export PYTHON3_HOST_PROG='/usr/bin/python3'
export XDG_CONFIG_HOME="$HOME/.config"
export GIT_REPOS_DIR="$HOME/repos"
export NVIM_CONFIG="$GIT_REPOS_DIR/config-nvim"
export GOROOT='/usr/local/go'
export GOPATH="$HOME/go"
export LOCAL_BIN="$HOME/.local/bin"
export HOMEBREW_PREFIX='/home/linuxbrew/.linuxbrew'
export HOMEBREW_CELLAR="$HOMEBREW_PREFIX/Cellar"
export HOMEBREW_REPOSITORY="$HOMEBREW_PREFIX/Homebrew"
export _ZL_CD='cd'
export PYTHONDONTWRITEBYTECODE=1

export FZF_DEFAULT_OPTS='
  --height 40% --layout=reverse --border
  --color fg:#D8DEE9,bg:#2E3440,hl:#A3BE8C,fg+:#D8DEE9,bg+:#434C5E,hl+:#A3BE8C
  --color pointer:#BF616A,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B
'

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#D08770,bold'
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

typeset -gA ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#BF616A,bold'
ZSH_HIGHLIGHT_STYLES[path]='fg=#88C0D0,bold,underline'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#5E81AC,bold'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=#81A1C1,bold'

export PATH=$PATH:"$HOMEBREW_PREFIX/bin"
export PATH=$PATH:"$HOMEBREW_PREFIX/sbin"
export PATH=$PATH:'/usr/local/go/bin'
export PATH=$PATH:"$GOPATH/bin"
export PATH=$PATH:"$GOROOT/bin"
export PATH=$PATH:"$HOME/.pyenv/bin"
export PATH=$PATH:"$HOME/.poetry/bin"
export PATH=$PATH:"$HOME/.cargo/bin"
export PATH=$PATH:"$HOME/.surrealdb"
export PATH=$PATH:"$HOME/.local/share/flatpak/exports/bin"
export PATH=$PATH:"$LOCAL_BIN"
export PATH=$PATH:"$PYENV_ROOT/bin"
export PATH=$PATH:"$HOME/.config/rofi/scripts"

eval "$(direnv hook zsh)"

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh
