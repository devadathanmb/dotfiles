local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
	vim.notify("Indent blankline not installed")
    return
end

indent_blankline.setup({
	show_end_of_line = true,
})
