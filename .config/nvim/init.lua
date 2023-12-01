require 'plugins'
require 'lsp'
require 'treesitter'
require 'aesthetics'

require 'orgmode'.setup_ts_grammar()
require 'orgmode'.setup({
  org_agenda_files = { '~/Notes/*' },
  org_default_notes_file = { '~/Notes/index.org' },
})

-- keymaps
local map = vim.api.nvim_set_keymap
vim.g.filetype_fs = 'forth'
vim.g.mapleader = ' '
map('','<leader>n',':lua NetrwVsplitToggle()<cr>',{noremap = true})
map('','<leader>v','<C-w>w',{noremap = true})
map('t','<ESC>','<C-\\><C-n>',{noremap = true})
map('','<leader>a','ggVG',{noremap = true})
map('','<leader>t',':lua TermToggle()<cr>',{noremap = true})
map('t','<ESC><leader>t','<C-\\><C-n>:hide<cr>:lua print("Terminal hidden!")<cr>',{noremap = true})
map('v','J', ":m '>+1<cr>gv=gv",{})
map('v','K', ":m '<-2<cr>gv=gv",{})

-- local builtin = require('telescope.builtin')
-- vim.keymap.set('n','<leader>f', builtin.find_files, {})


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

function NetrwVsplitToggle()
  local netrw_buffers = vim.fn.win_findbuf(vim.fn.bufnr('^NetrwTreeListing$'))
  if #netrw_buffers > 0 then
    vim.api.nvim_win_close(netrw_buffers[1],true)
  else
    vim.cmd("Vexplore 16")
  end
end

function TermToggle()
  local term_buffer = vim.fn.bufnr('^term://')
  local term_win = vim.fn.bufwinnr(term_buffer)
  if term_win == -1 then
    if term_buffer ~= -1 then
      vim.cmd(":bel 7split")
      vim.cmd(":b " .. term_buffer)
      vim.cmd(":startinsert")
      print("Terminal restored!")
    else
      vim.cmd(":bel 7split term://pwsh")
      print("New terminal created!")
    end
  else
    vim.cmd(term_win .. "hide")
    print("Terminal hidden!")
  end
end

-- autocmd
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'cpp',
  callback = function()
    map('n','<F5>',':bel 7split term://{pwsh -c \'g++ -o %< % && ./%<\'}<cr>',{noremap = true})
  end
})

vim.api.nvim_create_autocmd('TermOpen', {
  command = 'setlocal listchars= nonumber norelativenumber nocursorline'
})
vim.api.nvim_create_autocmd('TermOpen', {
  command = 'startinsert'
})
