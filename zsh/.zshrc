eval "$(starship init zsh)"
export ZSH="$HOME/.oh-my-zsh"
export BAT_THEME="Base16"
export GPG_TTY=$(tty)
export EDITOR='nvim'
export BAT_THEME="base16-256"

# zsh plugins
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh-completions
  fzf-tab
)

source $ZSH/oh-my-zsh.sh
enable-fzf-tab
export PATH=$PATH:/home/synoet/.local/bin
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# aliases
source $HOME/dotfiles/zsh/.aliases

# gpg key
export GPG_TTY=$(tty)
eval "$(ssh-agent -s)" > /dev/null
export GPG_TTY=$(tty)
ssh-me > /dev/null

# add ssh key to keychain
ssh-add --apple-use-keychain ~/personal &> /dev/null

# Prettier github diff output {
export PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
zstyle ':fzf-tab:*' switch-group ',' '.'
eval "$(zoxide init zsh)"
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin
# }

# Bun {
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# }

. "$HOME/.asdf/asdf.sh"
. "$HOME/.cargo/env"  
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# pnpm
export PNPM_HOME="/Users/synoet/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
source /Users/synoet/dev/macro-api/document-storage/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
