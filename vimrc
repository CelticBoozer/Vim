set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Vundle

Plugin 'gmarik/Vundle.vim'

"Other Plugins

Plugin 'edkolev/promptline.vim'
Plugin 'tomasr/molokai'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'rosenfeld/conque-term'
Plugin 'tpope/vim-surround'
Plugin 'garbas/vim-snipmate'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'
Plugin 'klen/python-mode'
Plugin 'davidhalter/jedi-vim'
Plugin 'mitsuhiko/vim-jinja'
Plugin 'mitsuhiko/vim-python-combined'
Plugin 'tpope/vim-markdown'
Plugin 'suan/vim-instant-markdown'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'bling/vim-airline'
Plugin 'ervandew/supertab'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'godlygeek/tabular'
Plugin 'MatlabFilesEdition'


" All of your Plugins must be added before the following line

call vundle#end()
filetype on
filetype plugin on
filetype plugin indent on

" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" Set UTF-8 encoding

set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" Commenting

set comments=sl:/*,mb:\ *,elx:\ */
set wildmode=longest:full
set wildmenu
set t_Co=256

syntax on

" Tabs and spaces

set shiftwidth=4	"1 tab == 4 spaces
set tabstop=4		"<TAB> == 4 spaces
set softtabstop=4	"<TAB> and backspace
set smarttab		"smart tab
set autoindent		"set auto indent
set smartindent		"set smart indent
set copyindent		"use exisiting indents for new indents
set preserveindent	"save as much indent structure as possible

"UI Config

set number					"line number
set showmatch				"highlight matching [({})]
set mat=2					"for showmatch, set how many tenth of second it blinks
set ruler					"show current position
set magic					"magicgic for regular expression
set confirm					"ask to save file
set showcmd					"display incomplete command in the lower right corner of the console
set undolevels=1000			"let vim allow 1000 undos
set textwidth=80

"Searching

set incsearch			   "search as char are entered
set hlsearch			   "highlight matches
set smartcase			   "smart with case search

"Folding

set foldenable	           "enable folds
set foldlevelstart=10      "prevent too many folds
set foldmethod=indent      "set fold based on indentation

"Movement

set mouse=a						 "mouse support in console (option + mouseclick for mac users)
set mousehide					 "hide cursor when typing
set scrolloff=5					 "minimum lines to keep above and below

"Instant markdown

filetype plugin on

"Rainbow parens

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"Indenting

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=black ctermbg=black
autocmd VimEnter * :IndentGuidesEnable

"Statusline

set laststatus=2

"Airline UI

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#formatter = 'unique_tail'

"Separators

let g:airline#extensions#tabline#left_sep = '▶'
let g:airline#extensions#tabline#left_alt_sep = '▶'
let g:airline#extensions#tabline#right_sep = '◀'
let g:airline#extensions#tabline#right_alt_sep = '◀'
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '◀'

function! AirlineInit()
	let g:airline_section_a = airline#section#create(['mode',' ','branch'])
	let g:airline_section_b = airline#section#create_left(['%F'])
	let g:airline_section_c = airline#section#create(['ffenc',' ','[%Y]'])
	let g:airline_section_x = airline#section#create(['%P'])   "P
	let g:airline_section_y = airline#section#create(['row:%l/%L ','(%03p%%)'])
	let g:airline_section_z = airline#section#create_right(['col:%03c'])
endfunction
autocmd VimEnter * call AirlineInit()

" Syntastic settings recommended
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Enable all checkers on same file

let g:syntastic_aggregate_errors = 1

"Enable syntax checkers

let g:syntastic_c_checkers = ['gcc']
let g:syntastic_cpp_checkers = ['cppcheck' , 'gcc' , 'make']
let g:syntastic_matlab_checkers = ['mlint']
let g:syntastic_markdown_checkers = ['mdl']
let g:syntastic_text_checkers = ['language_check' , 'atdtool']

let g:syntastic_cpp_compiler = 'clang++' " C++ compiler
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++' " C++11 support
let g:syntastic_cpp_compiler_options = ' -std=c++1y' " C++14 support

"NERDTree

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary")
map <C-n> :NERDTreeToggle<CR>

"Vim-markdown

autocmd BufNewFile,BufReadPost *.md set filetype=markdown    " *.md support

"Automatic Whitespace removal

autocmd VimEnter,BufReadPost,bufwritepost,bufenter * :FixWhitespace

"Malokai theme

let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai

"Smart backspace
set backspace=indent,eol,start

tab sball
set switchbuf=useopen

set novisualbell
set nu
set nobackup      " no backup files
set nowritebackup    " only indent case you don't want a backup file while editing
set noswapfile      "noswapfile no swap files


augroup vimrc_autocmds
	autocmd!
	autocmd FileType ruby,python,javascript,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
	autocmd FileType ruby,python,javascript,c,cpp match Excess /\%80v.*/
	autocmd FileType ruby,python,javascript,c,cpp set nowrap
augroup END

let g:snippets_dir = "~/.vim/vim-snippets/snippets"

map <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 0 " автофокус на Tagbar при открытии"

"ShowNERDTree on F3
map <F3> :NERDTreeToggle<CR>

"=====================================================
" Python-mode settings
"=====================================================
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

let g:pymode_doc = 0
let g:pymode_doc_key = 'K'

let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore="E501,W601,C0110"

let g:pymode_lint_write = 1

let g:pymode_virtualenv = 1

let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

let g:pymode_folding = 0

let g:pymode_run = 0

let g:jedi#popup_select_first = 0

"=====================================================
"User hotkeys
"=====================================================
"ConqueTerm
"IPython on F5

nnoremap <F5> :ConqueTermSplit ipython<CR>

"а debug-mode на <F6>
nnoremap <F6> :exe "ConqueTermSplit ipython " . expand("%")<CR>
let g:ConqueTerm_StartMessages = 0
let g:ConqueTerm_CloseOnEnd = 0
"Code check on PEP8

autocmd FileType python map <buffer> <leader>8 :PymodeLint<CR>


"Copy/past on Ctrl+C/Ctrl+V
 vmap <C-C> "+yi
 imap <C-V> "+gPi

 set foldcolumn=1

