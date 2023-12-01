local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require 'lazy'.setup({
  'wbthomason/packer.nvim',
  'neovim/nvim-lspconfig',
  'nvim-treesitter/nvim-treesitter',
  'nvim-treesitter/nvim-treesitter-context',
  'ap/vim-css-color',
  'nvim-lualine/lualine.nvim',
  'ms-jpq/coq.nvim',
  {'nvim-orgmode/orgmode', config = function() require('orgmode').setup{} end},
  'vimwiki/vimwiki',
  'ellisonleao/gruvbox.nvim',
})
