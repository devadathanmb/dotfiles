-- Allows neovim to access systemclipboard
vim.opt.clipboard = "unnamedplus"


-- Search options
vim.opt.ignorecase = true	-- Ignore case while searching
vim.opt.smartcase = true	-- Smart case searching

-- Indentation and line wrap
vim.opt.smartindent = true 	-- Make indentation smarter
vim.opt.wrap = false		-- No line wrapping
vim.opt.expandtab = true	-- Expand tab to spaces
vim.opt.tabstop = 4 		-- 4 spaces for a tab
vim.opt.shiftwidth = 4		-- 4 spaces for each indentation


-- Line numbering : Hybrid numbering
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2 	-- Sets number col width to 2


-- Cursor line
vim.opt.cursorline = true 	-- Highlight the current line


-- Split options
vim.opt.splitbelow = true 	-- Force horizontal splits below
vim.opt.splitright = true	-- Force vertical splits to right

-- Terminal gui colors to support more colors
vim.opt.termguicolors = true

-- Consider string-string as whole word
vim.opt.iskeyword:append("-") 

-- Disbale showing messages below
vim.opt.showmode = false

-- Disable autocommenting
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

