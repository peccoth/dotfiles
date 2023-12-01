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
vim.api.nvim_set_hl(0, "SignColumn", { bg = "bg" });

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
