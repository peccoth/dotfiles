vim.cmd [[packadd packer.nvim]]
require 'packer'.startup(function(use) 
  use 'wbthomason/packer.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/nvim-treesitter-context'
  use 'preservim/nerdtree'
  use 'ap/vim-css-color'
  use 'nvim-lualine/lualine.nvim'
  use 'ms-jpq/coq.nvim'
  use {'nvim-orgmode/orgmode', config = function() require('orgmode').setup{} end}
  use 'vimwiki/vimwiki'
  use 'kvrohit/mellow.nvim'
  use 'catppuccin/nvim'
  use 'rose-pine/neovim'
  use 'ellisonleao/gruvbox.nvim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
end)

require'treesitter-context'.setup{
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
  min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  line_numbers = true,
  multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
  trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
  -- Separator between context and content. Should be a single character string, like '-'.
  -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
  separator = nil,
  zindex = 20, -- The Z-index of the context window
  on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
}

require 'lualine'.setup {
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
require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {
    dark0 = "#121212",
  },
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})
vim.cmd.colorscheme 'gruvbox';
vim.o.background = 'dark';
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "fg" });

-- keymaps
local map = vim.api.nvim_set_keymap
vim.g.filetype_fs = 'forth'
vim.g.mapleader = ' '
map('','<leader>n',':NERDTreeToggle<cr>',{noremap = true})
map('','<leader>v','<C-w>w <cr>',{noremap = true})
map('t','<ESC>','<C-\\><C-n>',{noremap = true})
map('','<leader>a','ggVG',{noremap = true})
map('','<leader>t',':bel 7split term://$SHELL <cr>',{noremap = true})
map('t','<ESC><leader>t','<C-\\><C-n>:q<cr>',{noremap = true})
map('v','K', ":m '<-2<cr>gv=gv",{})
map('v','J', ":m '>+1<cr>gv=gv",{})

local builtin = require('telescope.builtin')
vim.keymap.set('n','<leader>f', builtin.find_files, {})


-- vim options
local opt = vim.opt
opt.showmode = false
opt.number = true
opt.relativenumber = true
opt.signcolumn = "auto"
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
