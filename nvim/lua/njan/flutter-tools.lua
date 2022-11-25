local status_ok, flutter_tools = pcall(require, "flutter-tools")
if not status_ok then
	vim.notify("Flutter tools not found")
end

flutter_tools.setup({
	flutter_path = "/opt/flutter/bin/flutter",
	lsp = {
		on_attach = require("njan.lsp.handlers").on_attach,
	},
})
