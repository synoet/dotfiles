fish_vi_key_bindings
fish_add_path ~/.cargo/bin

alias ls="eza --long --git --color"
alias cd="z"

set -gx EDITOR nvim
set -gx VISUAL nvim

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# pnpm
set -gx PNPM_HOME "/Users/synoet/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

alias claude="/Users/synoet/.claude/local/claude"
