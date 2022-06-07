call plug#begin('~/.config/nvim/plugged')
Plug 'ap/vim-css-color'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
call plug#end()
" STATUS LINE
set noshowmode
set laststatus=2
let g:lightline =  {
    \'colorscheme': 'srcery_drk',
    \}
"
set number relativenumber
set encoding=utf-8
set nocompatible
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set mouse=a
set ignorecase
set path+=**
set clipboard+=unnamedplus
syntax enable
" BINDINGS
let mapleader=" "
nnoremap <leader>- :vertical resize -5 <cr>
nnoremap <leader>= :vertical resize +5 <cr>
noremap <Leader>w <C-w>w <cr>
map <leader>a ggVG
nnoremap <leader>n :NERDTreeToggle<cr>
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
noremap <SPACE> <Nop>
autocmd filetype cpp nnoremap <F6> :w <bar> :!g++ -Wall -Wextra -std=c++17 -o %< % <cr>:!./%< <CR>
autocmd filetype cpp nnoremap <F5> :w <bar> :!g++ -Wall -Wextra -std=c++17 -o %< % <cr>
autocmd filetype ruby nnoremap <F5> :w <bar> :!ruby path_to_enlightenment.rb <cr>
" COLORS
highlight LineNr           ctermfg=8    ctermbg=none    cterm=none
highlight CursorLineNr     ctermfg=7    ctermbg=8       cterm=none
highlight VertSplit        ctermfg=0    ctermbg=8       cterm=none
highlight Statement        ctermfg=2    ctermbg=none    cterm=none
highlight Directory        ctermfg=4    ctermbg=none    cterm=none
highlight StatusLine       ctermfg=7    ctermbg=8       cterm=none
highlight StatusLineNC     ctermfg=7    ctermbg=8       cterm=none
highlight Comment          ctermfg=4    ctermbg=none    cterm=italic
highlight Constant         ctermfg=12   ctermbg=none    cterm=none
highlight Special          ctermfg=4    ctermbg=none    cterm=none
highlight Identifier       ctermfg=6    ctermbg=none    cterm=none
highlight PreProc          ctermfg=5    ctermbg=none    cterm=none
highlight String           ctermfg=12   ctermbg=none    cterm=none
highlight Number           ctermfg=1    ctermbg=none    cterm=none
highlight Function         ctermfg=1    ctermbg=none    cterm=none
