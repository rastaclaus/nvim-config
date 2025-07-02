vim.opt.tabstop = 4
vim.opt.shiftwidth = 0
vim.opt.expandtab = false

--listoptions
vim.opt.list = true
vim.opt.listchars = { tab = "->", trail = "-" }

-- disable startup message:
vim.opt.shortmess:append {s = true, I = true}

-- Space as leader:
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Clipboard settings
vim.g.clipboard = 'osc52'

--настройки поиска
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true
vim.opt.incsearch = true

--настройки форматирования
vim.wo.number = true
vim.wo.wrap = false

