set nu
set termguicolors
set ignorecase
set smartcase
set cursorline
if empty(glob('~/.config/nvim/autoload/plug.vim'))

silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

autocmd VimEnter * PlugInstall --sync | source $MYVIMRC

endif

call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jacoborus/tender.vim', {'branch': 'master'}
Plug 'scrooloose/nerdtree', {'branch': 'master'}
Plug 'Xuyuanp/nerdtree-git-plugin', {'branch': 'master'}
Plug 'epii1/fzf.vim', {'branch': 'master'}
Plug 'epii1/ag.vim', {'branch': 'master'}
Plug 'epii1/mru.vim', {'branch': 'master'}
Plug 'nvim-lua/plenary.nvim', {'branch': 'master'}
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'branch': 'master'}
call plug#end()

autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$")
      \ |   exe "normal! g`\""
      \ | endif

color tender
autocmd ColorScheme tender
\ | hi Normal guibg=#000000
\ | hi SignColumn guibg=#000000 "
\ | hi StatusLine guibg=#444444 guifg=#b3deef

let g:NERDTreeMinimalUI = 1
let g:NERDTreeChDirMode = 2
let g:NERDTreeWinSize = 24
nnoremap <leader>e :NERDTreeToggle<cr>
nnoremap <leader>f :NERDTreeFind<cr>

nnoremap <c-p> :call fzf#Open()<cr>
nnoremap <c-u> :Mru<cr>
runtime vim.lua

