require 'plugins'
require 'lsp'
require 'treesitter'
require 'aesthetics'

require 'orgmode'.setup({
  org_agenda_files = { '~/Notes/*' },
  org_default_notes_file = { '~/Notes/index.org' },
})

-- keymaps
local map = vim.api.nvim_set_keymap
vim.g.filetype_fs = 'forth'
vim.g.mapleader = ' '
map('','<leader>v','<C-w>w',{noremap = true})
map('t','<ESC>','<C-\\><C-n>',{noremap = true})
map('','<leader>a','ggVG',{noremap = true})
map('v','J', ":m '>+1<cr>gv=gv",{})
map('v','K', ":m '<-2<cr>gv=gv",{})

-- vim options
local opt = vim.opt
opt.showmode = false
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.expandtab = true
opt.smarttab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.switchbuf = opt.switchbuf + "useopen"
opt.mouse = 'a'
opt.clipboard = opt.clipboard + "unnamedplus"
opt.ignorecase = true
opt.scrolloff = 10
vim.g.netrw_liststyle = 3
vim.g.netrw_chgwin = 1
vim.g.netrw_browse_split = 4
vim.g.netrw_banner = 0
