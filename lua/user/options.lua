-- Space as leader:
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.tabstop = 4
vim.opt.shiftwidth = 0
vim.opt.expandtab = false

--listoptions
vim.opt.list = true
vim.opt.listchars = { tab = "->", trail = "-" }

-- disable startup message:
vim.opt.shortmess:append({ s = true, I = true })

-- Clipboard settings
vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard

vim.opt.termguicolors = true

--настройки поиска
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true
vim.opt.incsearch = true

--настройки форматирования
vim.wo.number = true
vim.wo.wrap = false

vim.opt.completeopt = "menu,menuone,noselect,fuzzy"

vim.opt.autoread = true
