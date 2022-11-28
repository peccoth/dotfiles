vim.cmd [[packadd packer.nvim]]
require 'packer'.startup(function(use) 
    use 'wbthomason/packer.nvim'
    use 'ap/vim-css-color'
    use 'preservim/nerdtree'
    use 'nvim-lualine/lualine.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'sainnhe/sonokai'
    use 'kvrohit/mellow.nvim'
    use 'folke/tokyonight.nvim'
    use {'nvim-orgmode/orgmode', config = function() require('orgmode').setup{} end}
end)

require 'lualine'.setup {
    options = {
        icons_enabled = false,
        -- theme = 'gruvbox_dark',
        theme = 'mellow',
        -- component_separators = { left = '', right = ''},
         component_separators = { left = '', right = ''},
        -- section_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = false,
    }
}

require 'orgmode'.setup_ts_grammar()
require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "cpp", "lua", "python", "bash", "css", "org" },
    auto_install = true, 
    highlight = {
        enable = true, 
        additional_vim_regex_highlighting = true,
    },
    indent = {
 	enable = true,
    },
}

require 'orgmode'.setup({ 
    org_agenda_files = { '~/Notes/*' },
    org_default_notes_file = { '~/Notes/index.org' },
})

vim.cmd.colorscheme 'tokyonight-storm';
-- keymaps
local map = vim.api.nvim_set_keymap
vim.g.filetype_fs = 'forth'
vim.g.mapleader = ' '
map('','<leader>n',':NERDTreeToggle<cr>',{noremap = true})
map('','<leader>w','<C-w>w <cr>',{noremap = true})
map('t','<ESC>','<C-\\><C-n>',{noremap = true})
map('','<leader>a','ggVG',{noremap = true})
map('','<leader>t',':bel 7split term://$SHELL <cr>',{noremap = true})
map('t','<ESC><leader>t','<C-\\><C-n>:q<cr>',{noremap = true})


-- vim options
local opt = vim.opt
opt.showmode = false
opt.number = true
opt.relativenumber = true

opt.expandtab = true
opt.smarttab = true
opt.tabstop = 4
opt.shiftwidth = 4

opt.switchbuf = opt.switchbuf + "useopen"

opt.mouse = 'a'

opt.clipboard = opt.clipboard + "unnamedplus"

opt.ignorecase = true

-- autocmd
local autocmd = vim.api.nvim_create_autocmd
autocmd('FileType', {
    pattern = 'cpp',
    callback = function() 
	    map('n','<F5>',':bel 7split term://{zsh -c \'g++ -o %< % && ./%<\'}<cr>',{noremap = true})
    end
})

autocmd('TermOpen', {
    command = 'setlocal listchars= nonumber norelativenumber nocursorline'
})
autocmd('TermOpen', {
    command = 'startinsert'
})
