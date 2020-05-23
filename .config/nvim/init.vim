call plug#begin('~/.config/nvim/plugged')

" Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'mitchdzugan/vim-sexp'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-salve'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fireplace'
Plug 'guns/vim-clojure-highlight'
Plug 'luochen1990/rainbow'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'clojure-vim/async-clj-omni'
Plug 'ayu-theme/ayu-vim'
Plug 'rakr/vim-one'
Plug 'wadackel/vim-dogrun'
Plug 'itchyny/lightline.vim'

call plug#end()

let g:clojure_syntax_keywords = {
    \ 'clojureMacro': ["defui", "defnm", "defm"],
    \ 'clojureFunc': ["$="]
    \ }

let g:clojure_fuzzy_indent_patterns = 'fnm,whenm,defui'
let g:rainbow_active = 1

let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('keyword_patterns', {'clojure': '[\w!$%&*+/:<=>?@\^_~\-\.#]*'})

" set termguicolors
" set background=dark
colorscheme dogrun

set number

nnoremap <space> :silent exec "!swan open"<enter>:<BS>
au BufEnter * silent exec "!swan enter"

function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()

