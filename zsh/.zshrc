eval "$(starship init zsh)"
export ZSH="$HOME/.oh-my-zsh"
export BAT_THEME="Base16"
export GPG_TTY=$(tty)
export EDITOR='nvim'

# zsh plugins
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  colorize
  fzf-tab
)

source $ZSH/oh-my-zsh.sh

enable-fzf-tab

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)" >/dev/null

export PATH=$PATH:/home/synoet/.local/bin


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# aliases
source $HOME/dotfiles/zsh/.aliases
eval "$(ssh-agent -s)" > /dev/null
export GPG_TTY=$(tty)

ssh-me > /dev/null
