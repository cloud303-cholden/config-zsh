# Profile startup performance
# zmodload zsh/zprof

eval "$(starship init zsh)"

setopt histignorealldups sharehistory

bindkey -v
bindkey "^?" backward-delete-char
bindkey -r "^J"
bindkey -M viins 'jk' vi-cmd-mode
bindkey '^[^M' self-insert-unmeta
function vi-yank-xclip {
  zle vi-yank
  echo -n "$CUTBUFFER" | xclip -selection clipboard
}
zle -N vi-yank-xclip
bindkey -M vicmd 'y' vi-yank-xclip

HISTSIZE=1000
SAVEHIST=5000
HISTFILE=~/.zsh_history

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

PROMPT_EOL_MARK=''

export XDG_CONFIG_HOME="$HOME/.config"
export HOMEBREW_PREFIX='/home/linuxbrew/.linuxbrew'
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export _ZL_CD='cd'

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --border
  --color fg:#D8DEE9,bg:#2E3440,hl:#A3BE8C,fg+:#D8DEE9,bg+:#3b4252,hl+:#A3BE8C,border:#81A1C1
  --color pointer:#3b4252,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#b1c89d,marker:#EBCB8B
  --prompt=" ❯ " --pointer="."'

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#D08770,bold'
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

typeset -gA ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#BF616A,bold'
ZSH_HIGHLIGHT_STYLES[path]='fg=#88C0D0,bold,underline'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#5E81AC,bold'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=#81A1C1,bold'

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

source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/doc/fzf/examples/completion.zsh

eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
eval "$(direnv hook zsh)"
eval "$(atuin init zsh --disable-up-arrow)"

# Profile startup performance
# zprof
