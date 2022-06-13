local _, lsp_installer = pcall(require, "nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("synoet.lsp.handlers").on_attach,
		capabilities = require("synoet.lsp.handlers").capabilities,
	}
	server:setup(opts)
end)
