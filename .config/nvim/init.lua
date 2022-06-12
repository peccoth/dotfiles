require "paq" {
    "savq/paq-nvim";
    "ap/vim-css-color";
    "preservim/nerdtree";
    "nvim-lualine/lualine.nvim";
    "nvim-treesitter/nvim-treesitter";
}
require('lualine').setup {
    options = {
        icons_enabled = false,
        theme = 'gruvbox_dark',
        -- component_separators = { left = '', right = ''},
         component_separators = { left = '', right = ''},
        -- section_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = false,
    }
}

require 'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true
    }
}
-- keymaps
local map = vim.api.nvim_set_keymap
vim.g.mapleader = ' '
map('','<leader>n',':NERDTreeToggle<cr>',{noremap = true})
map('','<leader>w','<C-w>w <cr>',{noremap = true})
map('','<leader>a','ggVG',{noremap = true})
map('','<leader>t',':split term://$SHELL <cr>',{noremap = true})


-- vim options
local opt = vim.opt
opt.showmode = false
opt.number = true
opt.relativenumber = true

opt.expandtab = true
opt.smarttab = true
opt.tabstop = 4
opt.shiftwidth = 4

opt.mouse = 'a'

opt.clipboard = opt.clipboard + "unnamedplus"

opt.ignorecase = true

-- autocmd
local autocmd = vim.api.nvim_create_autocmd
autocmd('FileType', {
    pattern = 'cpp',
    callback = function() 
	    map('n','<F5>',':w <cr> :terminal g++ -o %< % && ./%< <cr>',{noremap = true})
    end
})

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
