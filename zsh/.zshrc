eval "$(starship init zsh)"
export ZSH="$HOME/.oh-my-zsh"

EDITOR='vim'

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  colorize
  fzf-tab
)

source $ZSH/oh-my-zsh.sh
source ~/.zsh_profile

enable-fzf-tab

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Created by `pipx` on 2022-05-20 18:28:47
export PATH="$PATH:/home/synoet/.local/bin"
