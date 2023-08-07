local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
vim.api.nvim_set_var("mapleader", ",")

keymap("n", "<Leader>f", ":HopWord<CR>", opts)

-- Split Keymaps
keymap("n", "<C-v>", ":vsplit<CR>", opts)

-- Comment Keymaps
keymap("v", "<C-c>", ":Commentary<CR>", opts)
keymap("n", "<C-c>", ":Commentary<CR>", opts)

-- Split Navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Telescope Keybindings
keymap("n", "<C-p>", ":FzfLua files<CR>", opts)
keymap("n", "<C-f>", ":FzfLua live_grep_native<CR>", opts)
keymap("n", "<C-b>", ":FzfLua  buffers<CR>", opts)
keymap("n", "<C-s>", ":FzfLua <CR>", opts)
keymap("n", "<C-i>", ":lua require('lsp_lines').toggle()<CR>", opts)
keymap("n", "<C-a>", ":FzfLua lsp_code_actions<CR>", opts)
keymap("n", "<C-t>", ":NeoTreeFocusToggle<CR>", opts)


-- LSP Keybindings
keymap("n", "<C-r>", ":LspRestart <CR> :e! <CR>", opts) --refresh file

-- Buffer Navigation
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<C-w>", ":bdelete<CR>", opts)

-- Visual Mode Indentation 
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
