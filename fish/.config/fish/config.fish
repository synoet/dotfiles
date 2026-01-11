fish_vi_key_bindings
fish_add_path ~/.cargo/bin

alias ls="eza --long --git --color"
alias cd="z"

set -gx EDITOR hx
set -gx VISUAL hx

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# pnpm
set -gx PNPM_HOME /Users/synoet/Library/pnpm
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

alias claude="/Users/synoet/.claude/local/claude"

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
set -gx PATH $HOME/.cabal/bin /Users/synoet/.ghcup/bin $PATH # ghcup-env
