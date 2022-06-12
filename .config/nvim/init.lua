require "paq" {
    "savq/paq-nvim";
    "ap/vim-css-color";
    "preservim/nerdtree";
    "nvim-lualine/lualine.nvim";
}
require('lualine').setup {
    options = {
        theme = 'solarized_light'
    }
}
require('lualine').setup()

-- keymaps
local map = vim.api.nvim_set_keymap
vim.g.mapleader = ' '
map('','<leader>n',':NERDTreeToggle<cr>',{noremap = true})
map('','<leader>w','<C-w>w <cr>',{noremap = true})
map('','<leader>a','ggVG',{noremap = true})
map('','<leader>t',':split term://$SHELL <cr>',{noremap = true})

local autocmd = vim.api.nvim_create_autocmd
autocmd('FileType', {
    pattern = 'cpp',
    callback = function() 
	    map('n','<F5>',':w <cr> :terminal g++ -o %< % && ./%< <cr>',{noremap = true})
    end
})

-- vim options
local opt = vim.opt
opt.number = true
opt.relativenumber = true

opt.expandtab = true
opt.smarttab = true
opt.tabstop = 4
opt.shiftwidth = 4

opt.mouse = 'a'

opt.clipboard = opt.clipboard + "unnamedplus"

opt.ignorecase = true


autocmd('FileType', {
    pattern = 'cpp',
    command = 'noremap <F5> :!g++ -o %< % <cr><cr> :!./%< <cr>'
})
autocmd('TermOpen', {
    command = 'setlocal listchars= nonumber norelativenumber nocursorline'
})
autocmd('TermOpen', {
    command = 'startinsert'
})
