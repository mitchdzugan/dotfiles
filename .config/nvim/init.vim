call plug#begin('~/.config/nvim/plugged')

Plug 'mitchdzugan/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-salve'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fireplace'
Plug 'guns/vim-clojure-highlight'
Plug 'luochen1990/rainbow'
Plug 'itchyny/lightline.vim'
Plug 'venantius/vim-cljfmt'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'clojure-vim/async-clj-omni'
Plug 'ayu-theme/ayu-vim'
Plug 'rakr/vim-one'
Plug 'wadackel/vim-dogrun'
Plug 'phanviet/vim-monokai-pro'
Plug 'crusoexia/vim-monokai'
Plug 'nanotech/jellybeans.vim'

call plug#end()

set tabstop=4

let g:clojure_syntax_keywords = {
    \ 'clojureMacro': ["defui", "defnm", "defm", "defprotomethod", "deftagged"],
    \ 'clojureFunc': ["$="]
    \ }

let g:clojure_fuzzy_indent_patterns = 'fnm,whenm,defui,defprotomethod'
let g:rainbow_active = 1

let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('keyword_patterns', {'clojure': '[\w!$%&*+/:<=>?@\^_~\-\.#]*'})

set termguicolors
colorscheme ayu

set number

nnoremap <space> :silent exec "!swan open"<enter>:<BS>
au BufEnter * silent exec "!swan enter"
au BufWritePost * silent exec "!swan save"

function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()

"" remember last position
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif 

set hidden
set cursorline


let s:base03 = [ '#242424', 235 ]
let s:base023 = [ '#353535', 236 ]
let s:base02 = [ '#444444', 238 ]
let s:base01 = [ '#585858', 240 ]
let s:base00 = [ '#666666', 242  ]
let s:base0 = [ '#808080', 244 ]
let s:base1 = [ '#969696', 247 ]
let s:base2 = [ '#a8a8a8', 248 ]
let s:base3 = [ '#d0d0d0', 252 ]
let s:yellow = [ '#cae682', 180 ]
let s:orange = [ '#e5786d', 173 ]
let s:red = [ '#e5786d', 203 ]
let s:magenta = [ '#f2c68a', 216 ]
let s:blue = [ '#8ac6f2', 117 ]
let s:cyan = s:blue
let s:green = [ '#95e454', 119 ]
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:base02, s:blue ], 
        \		[ s:base3, s:base02 ] , 
        \		[ s:base3, s:base00 ], 
        \		[ s:base3, s:base02 ] ]
let s:p.inactive.left =  [ [ s:base1, s:base02 ], 
        \		   [ s:base3, s:base02 ] , 
	\                  [ s:base00, s:base023 ],
        \		   [ s:base3, s:base02 ] ]
let s:p.insert.left = [ [ s:base02, s:green ], 
        \		[ s:base3, s:base02 ] , 
	\               [ s:base3, s:base01 ],
        \		[ s:base3, s:base02 ] ]
let s:p.visual.left = [ [ s:base02, s:magenta ], 
        \		[ s:base3, s:base02 ] , 
	\               [ s:base3, s:base01 ],
        \		[ s:base3, s:base02 ] ]
let s:p.replace.left = [ [ s:base023, s:red ], 
        \		 [ s:base3, s:base02 ] , 
	\                [ s:base3, s:base01 ],
        \		 [ s:base3, s:base02 ] ]

let s:p.normal.right = [ [ s:base02, s:base0 ], [ s:base1, s:base01 ] ]
let s:p.inactive.right = [ [ s:base023, s:base01 ], [ s:base00, s:base02 ] ]
let s:p.normal.middle = [ [ s:base2, s:base02 ] ]
let s:p.inactive.middle = [ [ s:base1, s:base023 ] ]
let s:p.tabline.left = [ [ s:base3, s:base00 ] ]
let s:p.tabline.tabsel = [ [ s:base3, s:base03 ] ]
let s:p.tabline.middle = [ [ s:base2, s:base02 ] ]
let s:p.tabline.right = [ [ s:base2, s:base00 ] ]
let s:p.normal.error = [ [ s:base03, s:red ] ]
let s:p.normal.warning = [ [ s:base023, s:yellow ] ]

let g:lightline#colorscheme#wombattt#palette = lightline#colorscheme#flatten(s:p)

let g:lightline = {
      \ 'colorscheme': 'wombattt',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'tabs_left' ],
      \             [ 'tabs_hist', 'readonly', 'filename', 'modified'],
      \             [ 'tabs_right' ] ],
      \   'right': []
      \ },
      \ 'component_function': {
      \   'tabs_left': 'GetTabsLeft',
      \   'tabs_hist': 'GetTabsHist',
      \   'tabs_right': 'GetTabsRight'
      \ },
      \ }

let g:tabs_left = ""
let g:tabs_right = ""
let g:tabs_hist = ""

function! GetTabsLeft()
	return g:tabs_left
endfunction

function! GetTabsRight()
	return g:tabs_right
endfunction

function! GetTabsHist()
	return g:tabs_hist
endfunction
