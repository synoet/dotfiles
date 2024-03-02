eval "$(starship init zsh)"
export ZSH="$HOME/.oh-my-zsh"
export BAT_THEME="Base16"
export GPG_TTY=$(tty)
export EDITOR='nvim'
export BAT_THEME="base16-256"

# zsh plugins
plugins=(
  git
  zsh-completions
  zsh-syntax-highlighting
  zsh-vi-mode
  zsh-autosuggestions
  # colorize
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
export GPG_TTY=$(tty)

ssh-add --apple-use-keychain ~/personal &> /dev/null

export PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
zstyle ':fzf-tab:*' switch-group ',' '.'
source /Users/synoet/deps/emsdk/emsdk_env.sh &> /dev/null
eval "$(zoxide init zsh)"
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/synoet/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


if [ -f '/Users/synoet/.cdwe.zsh' ]; then . '/Users/synoet/.cdwe.zsh'; fi

# bun completions
[ -s "/Users/synoet/.bun/_bun" ] && source "/Users/synoet/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

if [ -f '/home/synoet/.cdwe.zsh' ]; then . '/home/synoet/.cdwe.zsh'; fi

# source "/home/synoet/dev/emsdk/emsdk_env.sh"
