require "paq" {
    "savq/paq-nvim";
    "ap/vim-css-color";
    "preservim/nerdtree";
}
local opt = vim.opt

local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

opt.number = true
opt.relativenumber = true
opt.expandtab = true
opt.smarttab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.mouse = a
opt.clipboard = opt.clipboard + "unnamedplus"
opt.ignorecase = true
