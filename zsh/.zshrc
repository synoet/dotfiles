eval "$(starship init zsh)"
export ZSH="$HOME/.oh-my-zsh"
export BAT_THEME="TwoDark"
export GPG_TTY=$(tty)

export EDITOR='nvim'


plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  colorize
  fzf-tab
  zshpilot
#  zsh-vi-mode
)

source $ZSH/oh-my-zsh.sh
source ~/.zsh_profile

enable-fzf-tab

alias f='cd $(fd --type d --hidden --exclude .git --exclude node_module --exclude .cache --exclude .npm --exclude .mozilla --exclude .meteor --exclude .nv | fzf)'


[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)" >/dev/null

export PATH="$PATH:/Users/synoet/.local/bin"

#eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
