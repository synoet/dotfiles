local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end


require "synoet.lsp.installer"
require("synoet.lsp.handlers").setup()
require("lsp_lines").setup()
