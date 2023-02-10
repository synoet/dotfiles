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
#  zsh-vi-mode
)

source $ZSH/oh-my-zsh.sh
source ~/.zsh_profile

enable-fzf-tab

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)" >/dev/null

export PATH="$PATH:/Users/synoet/.local/bin"

#eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
