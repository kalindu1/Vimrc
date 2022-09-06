""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set encoding=utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=50

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
"set so=7

" Avoid garbled characters in Chinese language windows OS

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
"set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
"

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
"set wrap "Wrap lines


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <C-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


source $VIMRUNTIME/vimrc_example.vim


" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction


"if !has('gui_running')
 " set t_Co=256
"endif



" Tool bar ad menu bar configuration

set guioptions-=m "menu bar
set guioptions-=T  "toolbar
set guioptions-=r
set guioptions-=L
set guioptions-=e

"colorscheme onedark
" wombat


"let g:lightline = {
"    \ 'colorscheme': 'default',
"\ }

set encoding=utf8
set rnu
set expandtab
set autoindent
set tabstop=4 softtabstop=4
set smartindent
set nowrap
set noswapfile
set laststatus=2


set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files


syntax on
set clipboard=unnamed
let mapleader = ","


set nohlsearch
set t_md=
"go full screen



" python executing
nnoremap <F10> :echo system('python "' . expand('%') . '"')<cr>



"set guifont=DejaVuSansMono_NF:h11
set encoding=utf-8
" required if using https://github.com/bling/vim-airline



" Mapping to reload configuration
"nmap <leader>so :source $HOME\_vimrc<CR>
nmap <leader>so :source ~\_vimrc<CR>
nmap <C-f> :NERDTreeToggle<CR>
nmap <C-n> :bnext <CR>
nmap <C-b> :bprevious <CR>
" autocmd VimEnter * SyntasticToggleMode

let g:cpp_class_scope_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_concepts_highlight = 1
let python_highlight_all = 1


" set guifont=FiraCode\ NF:h12
"set guifont=JetBrainsMono\ NF:h11
"set guifont=Consolas:h10
"set guifont=DejaVuSansMono\ NF:h12
"set guifont=DroidSansMono\ NF:h12
"set guifont=Roboto\ Mono\ NF:h12
"set guifont=DejaVuSansMono\ NF:h10
"set guifont=FiraCode\ NF:h11
"set guifont=SauceCodePro\ NF:h12
"set guifont=SauceCodePro\ NF\ Bold:h12
set guifont=Hack\ NF:h12
"set guifont=UbuntuMono\ NF:h12
"set guifont=UbuntuMono\ NF:h12
"set guifont=Ubuntu\ Mono:h11



if has('python3')
endif

let g:NERDTreeLimitedSyntax = 1


call plug#begin('~/vimfiles/plugged/')

Plug 'scrooloose/nerdcommenter'
"Plug 'alvan/vim-closetag'

"Plug 'karoliskoncevicius/moonshine-vim'

" Plug 'jdsimcoe/panic.vim'

"Plug 'preservim/NERDTree'

"Plug 'lifepillar/vim-mucomplete'
Plug 'vim-scripts/AutoComplPop'

"Plug 'ncm2/ncm2'
"Plug 'roxma/nvim-yarp'
"Plug 'ncm2/ncm2-bufword'
"Plug 'ncm2/ncm2-path'
"Plug 'roxma/vim-hug-neovim-rpc'
Plug 'pechorin/any-jump.vim'
"Plug 'ervandew/supertab'
"Plug 'turbio/bracey.vim'
"Plug 'mattn/emmet-vim'

"Plug 'wadackel/vim-dogrun'

" Plug 'whatyouhide/vim-gotham'

Plug 'jiangmiao/auto-pairs'
"Plug 'junegunn/rainbow_parentheses.vim'
Plug 'frazrepo/vim-rainbow'

"Plug 'kien/rainbow_parentheses.vim'
"Plug 'frazrepo/vim-rainbow'
"Plug 'luochen1990/rainbow'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Plug 'itchyny/lightline.vim'
" Plug 'mengelbrecht/lightline-bufferline'

"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'


Plug 'majutsushi/tagbar'

"Plug 'prettier/vim-prettier', {
  "\ 'do': 'yarn install --frozen-lockfile --production',
  "\ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html', 'python'] }


"Plug 'mattn/vimtweak'
"Plug 'movsb/gvim_fullscreen'
"Plug 'derekmcloughlin/gvimfullscreen_win32'
"Plug 'ruedigerha/vim-fullscreen'

"Plug 'mattn/transparency-windows-vim'


"Plug 'tsuyoshicho/transparency.vim'

"Plug 'endel/vim-github-colorscheme'


"Plug 'vim-syntastic/syntastic'


"Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

" Plug 'vim-python/python-syntax'
Plug 'sheerun/vim-polyglot'

"Plug 'dragfire/improved-syntax-highlighting-vim'

"Plug 'octol/vim-cpp-enhanced-highlight'

"Plug 'vim-scripts/Visual-Studio'

"Plug 'lifepillar/vim-solarized8'

"Plug 'siphalor/vim-atomified'

"Plug 'vim-scripts/darkgit.vim'

"Plug 'dracula/vim'

"Plug 'dunstontc/vim-vscode-theme'

"Plug 'vim-scripts/Visual-Studio'

"Plug 'sonph/onehalf'

"Plug 'crusoexia/vim-monokai'
"Plug 'sickill/vim-monokai'
"Plug 'ayu-theme/ayu-vim'
"Plug 'fcpg/vim-orbital'
"Plug 'fcpg/vim-fahrenheit'
"Plug 'drewtempelmeyer/palenight.vim'
"Plug 'sainnhe/sonokai'
"Plug 'blueshirts/darcula' 
"Plug 'patstockwell/vim-monokai-tasty'
"Plug 'morhetz/gruvbox'
"Plug 'tomasiser/vim-code-dark'
"Plug 'vim-scripts/herald.vim'
"Plug 'ajmwagar/vim-deus'
" Plug 'alessandroyorba/alduin'
" "Plug 'srcery-colors/srcery-vim'
"Plug 'sainnhe/gruvbox-material'
"Plug 'joshdick/onedark.vim'
"Plug 'drewtempelmeyer/palenight.vim'
"Plug 'gruvbox-community/gruvbox'
"Plug 'ajh17/spacegray.vim'
"Plug 'dracula/vim'
"Plug 'sainnhe/vim-color-forest-night'
"Plug 'altercation/vim-colors-solarized'
"Plug 'mhartington/oceanic-next'
"Plug 'cocopon/iceberg.vim'
"Plug 'dracula/vim'
"Plug 'ulwlu/elly.vim'
"Plug 'kalindu1/GreenCode.vim'
"Plug 'kalindu1/term-gruvbox'
"Plug 'arcticicestudio/nord-vim'
"Plug 'nanotech/jellybeans.vim'

"Plug 'lifepillar/vim-gruvbox8'
Plug 'ghifarit53/tokyonight-vim'
"Plug 'sainnhe/edge'

"Plug 'vim-scripts/Blueshift'

"Plug 'vim-python/python-syntax'

"Plug 'henrynewcomer/vim-theme-papaya'

"Plug 'chriskempson/tomorrow-theme'

"Plug 'geoffharcourt/one-dark.vim'



"
"Plug 'joshdick/onedark.vim'

"Plug 'mhinz/vim-startify'

"Plug 'sainnhe/sonokai'

"Plug 'neoclide/coc.nvim'
"Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build' }

"Plug 'ryanoasis/powerline-extra-symbols'

"Plug 'vim-scripts/c.vim'

" debugger
"Plug 'puremourning/vimspector'


"Plug 'tomasiser/vim-code-dark'

"Plug 'ghifarit53/tokyonight-vim'


"Plug 'alessandroyorba/despacio'

"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'Brettm12345/moonlight.vim'

"Plug 'kkoenig/wimproved.vim'
"Plug 'bling/vim-bufferline'
Plug 'mbbill/undotree'
"Plug 'ray-x/material_plus.nvim'
"Plug 'kien/ctrlp.vim'
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'tomasr/molokai'

"Plug 'cocopon/iceberg.vim'

"Plug 'lifepillar/vim-solarized8'
Plug 'ryanoasis/vim-devicons'
call plug#end()




" jumping to definition


"" Normal mode: Jump to definition under cursor
nnoremap <leader>j :AnyJump<CR>

" Visual mode: jump to selected text in visual mode
xnoremap <leader>j :AnyJumpVisual<CR>

" Normal mode: open previous opened file (after jump)
nnoremap <leader>ab :AnyJumpBack<CR>

" Normal mode: open last closed search window again
nnoremap <leader>al :AnyJumpLastResults<CR>



" Show line numbers in search rusults
let g:any_jump_list_numbers = 0

" Auto search references
let g:any_jump_references_enabled = 1

" Auto group results by filename
let g:any_jump_grouping_enabled = 0

" Amount of preview lines for each search result
let g:any_jump_preview_lines_count = 5

" Max search results, other results can be opened via [a]
let g:any_jump_max_search_results = 10

" Prefered search engine: rg or ag
let g:any_jump_search_prefered_engine = 'rg'


" Search results list styles:
" - 'filename_first'
" - 'filename_last'
let g:any_jump_results_ui_style = 'filename_first'

" Any-jump window size & position options
let g:any_jump_window_width_ratio  = 0.6
let g:any_jump_window_height_ratio = 0.6
let g:any_jump_window_top_offset   = 4

" Customize any-jump colors with extending default color scheme:
" let g:any_jump_colors = { "help": "Comment" }

" Or override all default colors
let g:any_jump_colors = {
      \"plain_text":         "Comment",
      \"preview":            "Comment",
      \"preview_keyword":    "Operator",
      \"heading_text":       "Function",
      \"heading_keyword":    "Identifier",
      \"group_text":         "Comment",
      \"group_name":         "Function",
      \"more_button":        "Operator",
      \"more_explain":       "Comment",
      \"result_line_number": "Comment",
      \"result_text":        "Statement",
      \"result_path":        "String",
      \"help":               "Comment"
      \}

" Disable default any-jump keybindings (default: 0)
let g:any_jump_disable_default_keybindings = 1

" Remove comments line from search results (default: 1)
let g:any_jump_remove_comments_from_results = 1

" Custom ignore files
" default is: ['*.tmp', '*.temp']
let g:any_jump_ignored_files = ['*.tmp', '*.temp']

" Search references only for current file type
" (default: false, so will find keyword in all filetypes)
let g:any_jump_references_only_for_current_filetype = 0

" Disable search engine ignore vcs untracked files
" (default: false, search engine will ignore vcs untracked files)
let g:any_jump_disable_vcs_ignore = 0


" tagbar

nmap <F8> :TagbarToggle<CR>


"let g:ctrlp_working_path_mode = 'ra'

"let g:python_highlight_all = 1

" autocmd GUIEnter * silent! WToggleClean
" autocmd GUIEnter * silent! WSetAlpha 235
"
" map <F11> <Esc>:WToggleFullscreen<CR>
"
let  g:C_UseTool_cmake    = 'yes'
let  g:C_UseTool_doxygen = 'yes'

" let g:vimtweak_dll_path = 'H:\vim\vim82\vimtweak32.dll'

"map <F11> <Esc>:call libcallnr("gvimfullscreen_64.dll", "ToggleFullScreen", 0)<CR>
"map <F11> <Esc>:call libcallnr("vimtweak64.dll", "EnableMaximize", 1)<CR>
noremap <f11> <esc>:call libcallnr('gvim_fullscreen.dll', 'ToggleFullscreen', 0)<cr>

"transparency
"noremap <f12> <esc>:call libcallnr('gvim_fullscreen.dll', 'ToggleTransparency', "220, 130")<cr>
"autocmd VimEnter * :call libcallnr('gvim_fullscreen.dll', 'ToggleTransparency', "240, 180")

"let g:python_highlight_all = 1

map <F5> <Esc>:UndotreeToggle<CR>
set undodir=$HOME/.vim/undo-dir
set undofile 

" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

let g:NERDTreeDirArrowExpandable =  ''
let g:NERDTreeDirArrowCollapsible = ''

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1


" let g:NERDTreeDirArrowExpandable =  ''
" let g:NERDTreeDirArrowCollapsible = ''

set background=dark

" let g:webdevicons_enable_nerdtree = 1
" let g:webdevicons_conceal_nerdtree_brackets = 1

"let g:webdevicons_enable_ctrlp = 1
set noshowmode

" Default colorshcemes



"colorscheme blue
"colorscheme delek
"colorscheme evening
"colorscheme industry
"colorscheme murphy
"colorscheme shine
"colorscheme zellner
"colorscheme color

"colorscheme dark_plus
"colorscheme gruvbox

" default
" atlantis
" andromeda
" shusia
" maia
" espresso


" high constrant themes
"colorscheme fahrenheit
"colorscheme orbital


" let g:sonokai_enable_italic = 1
" let g:sonokai_disable_italic_comment = 1


"let g:sonokai_style = 'andromeda'
"let g:sonokai_style = 'atlantis'
"let g:sonokai_style = 'shusia'
"let g:sonokai_style = 'espresso'
"let g:sonokai_cursor = 'red'


"colorshceme herald
"colorscheme sonokai
"colorscheme palenight
"colorscheme everforest
"colorscheme tokyonight
"colorscheme dracula
"colorscheme sonokai
"colorscheme onehalfdark 
"colorscheme sonokai
"colorscheme everforest
"colorscheme VisualStudioDark
"colorscheme visualstudio
"colorscheme monokai
"colorscheme vim-monokai-tasty 
"colorscheme despacio
"colorscheme onedark
"colorscheme OceanicNext
"colorscheme atom 
"colorscheme spacegray
"colorscheme GreenCode
"colorscheme dracula
"colorscheme elly
"colorscheme gruvbox
"colorscheme term-gruvbox
"colorscheme onedark
"colorscheme norcolorscheme dracula 
"colorscheme dogrun
"colorscheme gotham
"colorscheme atom
"colorscheme iceberg
"colorscheme ayu
" colorscheme moonshine_minimal
"colorscheme molokai
"colorscheme codedark
"colorscheme gruvbox-material
"colorscheme iceberg
"colorscheme solarized8_flat
"colorscheme palenight
"colorscheme jellybeans
"colorscheme gruvbox8_hard
"colorscheme GreenCode
"colorscheme ayu
"colorscheme onedark
"colorscheme edge
colorscheme tokyonight



"let g:airline_theme = 'gruvbox8'


"'autoshelldir'	
"'cdhome'		
"'cinscopedecls'	
"'guiligatures'	
"'mousemoveevent'
"'quickfixtextfunc'	
"'spelloptions'		
"'thesaurusfunc'		
"'xtermcodes'		

"bracket colorization

"let g:rainbow#max_level = 16"let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

"autocmd FileType * RainbowParentheses
"let g:rainbow#blacklist = [233, 234]

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle


" airline themes
"let g:airline_theme = 'biogoo'




set statusline=%F%m%r%h%w%=\ [%Y]\ [%{&ff}]\ [%04l,%04v]\ [%p%%]\ [%L]
nmap <C-o> :CtrlPMRUFiles<CR>

"enable tabline
" let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#enabled = 1
"
"
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = ' '
" let g:airline#extensions#tabline#right_sep = ' '
" let g:airline#extensions#tabline#right_alt_sep = ' '
"
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
"
"   " powerline symbols
" "
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''





" let g:airline#extensions#tabline#left_sep = ''
" let g:airline#extensions#tabline#left_alt_sep = ''
" let g:airline#extensions#tabline#right_sep = ''
" let g:airline#extensions#tabline#right_alt_sep = ''

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = ''




let g:airline_symbols.branch = ' '
let g:airline_symbols.colnr = ' :'
let g:airline_symbols.readonly = ' '
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = ' ☰ '
let g:airline_symbols.dirty = ' ⚡'


" parentheses Config

let g:rainbow_active = 1

let g:rainbow_load_separately = [
    "\ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*' , [['(', ')'], ['{', '}'] ] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

"let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']

" onedark
let g:rainbow_guifgs = ['#E06C75', '#61AFEF', '#C678DD', '#56B6C2']

