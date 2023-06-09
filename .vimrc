let mapleader = " "

" ------------------------------------------------------------------------------
" general options
" ------------------------------------------------------------------------------
set history=500
set nobackup
set nowritebackup
set noswapfile
set number
set numberwidth=5
set clipboard=unnamed
set showcmd
set ruler
set encoding=utf-8
set showmatch
set splitbelow
set splitright
set pastetoggle=<F2>
set nomodeline
set wildmenu
set mouse=a

filetype plugin on
filetype indent on

" ------------------------------------------------------------------------------
" Set to auto read when a file is changed from the outside
" ------------------------------------------------------------------------------
set autoread
au FocusGained,BufEnter * checktime

" ------------------------------------------------------------------------------
" plugins
" ------------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')
  Plug 'preservim/nerdtree'
  Plug 'jiangmiao/auto-pairs'
  Plug 'alvan/vim-closetag'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'Valloric/YouCompleteMe'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
call plug#end()

" ------------------------------------------------------------------------------
" Airline
" ------------------------------------------------------------------------------
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" ------------------------------------------------------------------------------
" YCM
" ------------------------------------------------------------------------------

set completeopt-=preview

" ------------------------------------------------------------------------------
" NerdTree
" ------------------------------------------------------------------------------
autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
autocmd BufWinEnter * silent NERDTreeMirror

" ------------------------------------------------------------------------------
" auto indentacion
" ------------------------------------------------------------------------------
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set lbr
set tw=500
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" ------------------------------------------------------------------------------
" auto close tags
" ------------------------------------------------------------------------------
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,javascript.jsx,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'
autocmd BufNewFile,BufRead *.js set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx

" ------------------------------------------------------------------------------
" backspace
" ------------------------------------------------------------------------------
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

let g:coc_disable_startup_warning = 1

" ------------------------------------------------------------------------------
" atajos
" ------------------------------------------------------------------------------
" NerdTree
nnoremap <leader>n :NERDTreeFocus<CR>
" cambiar entre paneles
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" guardar / salir
nmap <leader>w :w!<cr>
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>wq :wq<CR>
nmap <Leader>qa :qa<CR>
" teclas f
map <F7> gg=G<C-o><C-o> " ordenar todo el archivo
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>
" visual mode
vmap D y'>p
" terminal
tnoremap <Esc><Esc> <C-\><C-n>

" ctrl c copies to clipboard
vnoremap <C-C> :w !xclip -i -sel c<CR><CR>
