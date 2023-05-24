eval "$(starship init zsh)"
export ZSH="$HOME/.oh-my-zsh"
export BAT_THEME="Base16"
export GPG_TTY=$(tty)
export EDITOR='nvim'

# zsh plugins
plugins=(
  git
  zsh-syntax-highlighting
#  zsh-vi-mode
  zsh-autosuggestions
  colorize
  fzf-tab
)

source $ZSH/oh-my-zsh.sh

enable-fzf-tab

export PATH=$PATH:/home/synoet/.local/bin


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# aliases
source $HOME/dotfiles/zsh/.aliases
eval "$(ssh-agent -s)" > /dev/null
export GPG_TTY=$(tty)

ssh-me > /dev/null

export FLYCTL_INSTALL="/home/synoet/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"
source /Users/synoet/dotfiles/nvim/.config/nvim/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export GPG_TTY=$(tty)
