local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "teo.lsp.lsp-installer"
require("teo.lsp.handlers").setup()
require "teo.lsp.null-ls"
