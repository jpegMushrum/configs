-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Базовые настройки
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = false
vim.opt.smartindent = true
vim.o.shell = "/usr/bin/fish"

-- Отключаем прозрачность фона
vim.o.winblend = 0
vim.o.pumblend = 0

-- clipboard
vim.opt.clipboard = 'unnamedplus'

-- Применяем тему
require("colors").setup()
