local status_ok, flutter_tools = pcall(require, "flutter-tools")
if not status_ok then
    vim.notify("Flutter tools not found")
end

flutter_tools.setup{}
