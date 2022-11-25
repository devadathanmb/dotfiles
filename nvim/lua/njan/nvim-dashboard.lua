local status_ok, dashboard = pcall(require, "dashboard")
if not status_ok then
    return
end

local db = dashboard

-- File browser command to open .config directory
local dots_action = "lua require'telescope'.extensions.file_browser.file_browser({path = vim.fn.expand('$HOME/dotfiles')})"

db.custom_header = {
    '',
    '      ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
    '      ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
    '      ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
    '      ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
    '      ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
    '      ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
}


db.custom_center = {
  { icon = '  ', desc = 'Find files', action = 'Telescope find_files' },
  { icon = '  ', desc = 'New file', action = 'enew' },
  { icon = '  ', desc = 'Recent files', action = 'Telescope oldfiles' },
  { icon = '  ', desc = 'File browser', action = 'Telescope file_browser' },
  { icon = '  ', desc = 'Open configs', action = dots_action },
  { icon = '  ', desc = 'Quit', action = 'q' },

}

db.custom_footer  = {"   Happy Hacking!   "}

vim.api.nvim_create_autocmd("FileType", {
  pattern = "dashboard",
  group = vim.api.nvim_create_augroup("dashboard_enter", { clear = true }),
  callback = function ()
    vim.keymap.set("n", "q", ":qa<CR>", { buffer = true, silent = true })
    vim.keymap.set("n", "e", ":enew<CR>", { buffer = true, silent = true })
  end
})
