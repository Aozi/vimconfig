call plug#begin('~/.vim/plugged')

"Basics

Plug 'scrooloose/nerdtree'

Plug 'bling/vim-airline'

Plug 'vim-airline/vim-airline-themes'

Plug 'Shougo/vimproc.vim', {'do' : 'make'}

"Autocompletes

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'tpope/vim-rails'

Plug 'pangloss/vim-javascript'

Plug 'ervandew/supertab'

Plug 'SirVer/ultisnips'

Plug 'honza/vim-snippets'

Plug 'osyo-manga/vim-monster'

Plug 'scrooloose/syntastic'

Plug 'vim-ruby/vim-ruby'


"Misc
Plug 'bronson/vim-trailing-whitespace'

Plug 'junegunn/rainbow_parentheses.vim'

call plug#end()

colorscheme solarized
syntax enable
set background=dark

set nocompatible
set tabstop=4 "Tab size
set softtabstop=4 "Tab to space size

set t_Co=256 "256 color mode

"set termguicolors

set number "show line number
set showcmd "Display comnmands
set cursorline "Highlight current line
filetype indent on "Language specific indent files
set wildmenu "autcomplete for commands
set lazyredraw "only draw when need to
set showmatch "highlight matching brackets
set wrap "Line wrapping

set incsearch "search as characters are entered
set hlsearch "highlight search matches"

"Show invisible chars
set list 
set listchars=tab:▸\ ,eol:¬

set foldenable "Enabled folding
set foldlevelstart=10 "shows most folds by default
set foldnestmax=10 "Maximum nested folds

let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1

" NERDTree, Use F3 for toggle NERDTree
nmap <silent> <F3> :NERDTreeToggle<CR>

"Deoplete
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif

" let g:deoplete#disable_auto_complete = 1 
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end
" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif

let g:monster#completion#rcodetools#backend = "async_rct_complete"
let g:deoplete#sources#omni#input_patterns = {
        \   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
        \}

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

"rainbow parentheses
"
au VimEnter * RainbowParentheses
