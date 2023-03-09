local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
vim.api.nvim_set_var("mapleader", ",")

keymap("n", "<Leader>f", ":HopWord<CR>", opts)

-- Split Keymaps
keymap("n", "<C-v>", ":vsplit<CR>", opts)

-- Comment Keymaps
keymap("n", "<C-/>", ":Commentary<CR>", opts)

-- Split Navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Telescope Keybindings
keymap("n", "<C-p>", ":Telescope find_files<CR>", opts)
keymap("n", "<C-f>", ":Telescope live_grep<CR>", opts)
keymap("n", "<C-b>", ":Telescope buffers<CR>", opts)
keymap("n", "<C-s>", ":Telescope current_buffer_fuzzy_find<CR>", opts)
keymap("v", "<C-x>", ":lua require('telescope').extensions.refactoring.refactors()<CR>", opts)


-- LSP Keybindings
keymap("n", "<C-r>", ":LspRestart <CR>", opts)

-- Buffer Navigation
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Visual Mode Indentation 
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
