local lsp = require('lsp-zero')
local cmp = require('cmp')

lsp.preset('recommended')
lsp.nvim_workspace()
lsp.setup_nvim_cmp({
  window = {
    completion = {
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
      col_offset = -4,
      side_padding = 2,
    },
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = " " .. (strings[1] or "") .. " "
      kind.menu = "    (" .. (strings[2] or "") .. ")"

      return kind
    end,
  },
  mapping = {
    ["<CR>"] = cmp.mapping.confirm { select = true },
    ["<C-j>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<C-k>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),

  }
})

vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = true,
})

lsp.setup()

local null_ls = require('null-ls')
local null_opts = lsp.build_options('null-ls', {})

null_ls.setup({
  on_attach = function(client, bufnr)
    null_opts.on_attach(client, bufnr)
  end,
  sources = {
    -- You can add tools not supported by mason.nvim
  }
})

require('mason-null-ls').setup({
  ensure_installed = nil,
  automatic_installation = true, -- You can still set this to `true`
  automatic_setup = true,
})

require("mason-lspconfig").setup()

-- require('mason-null-ls').setup_handlers()

require('lsp_lines').setup()

local util = require('lspconfig/util')

require("lspconfig").pyright.setup({
  root_dir = util.root_pattern('pyproject.toml', 'setup.py', 'setup.cfg', '.git'),
})

require"fidget".setup{}

