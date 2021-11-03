"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: 
"       Amir Salihefendic — @amix3k
"
" Awesome_version:
"       Get this config, nice color schemes and lots of plugins!
"
"       Install the awesome version from:
"
"           https://github.com/amix/vimrc
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

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

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en' 
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

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
set hid

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

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif


" Add a bit extra margin to the left
set foldcolumn=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif


"set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

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
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


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

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction




autocmd filetype cpp nnoremap <F5> :w <bar> !g++ -std=c++17 -O2 -Wall % -o %:r && %:r.exe <CR>" Vim with all enhancements
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


"colorscheme onedark
" wombat


"let g:lightline = {
"    \ 'colorscheme': 'default',
"\ }

set encoding=utf8
set nu
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


"colorscheme gruvbox 
"colorscheme VisualStudioDark 

"set guifont=DejaVuSansMono_NF:h11
set encoding=utf-8
" required if using https://github.com/bling/vim-airline



" Mapping to reload configuration
"nmap <leader>so :source $HOME\_vimrc<CR>
nmap <leader>so :source ~\_vimrc<CR>
nmap <C-f> :NERDTreeToggle<CR>
nmap <C-n> :bnext <CR>
nmap <C-b> :bprevious <CR>
"autocmd VimEnter * NERDTree
"autocmd VimEnter * e ~\vim.txt 

"
autocmd VimEnter * SyntasticToggleMode

let g:cpp_class_scope_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_concepts_highlight = 1
let python_highlight_all = 1


"set guifont=DejaVuSansMono\ NF:h10
"set guifont=FiraCode\ NF:h10
"set guifont=SauceCodePro\ NF:h10
set guifont=Hack\ NF:h10
"set guifont=UbuntuMono\ NF:h10
" set guifont=UbuntuMono\ NF:h12

"colorscheme onedark


"colorscheme onedark

"let g:airline_theme='base16_monokai'
"let g:airline_theme='everforest'
":u
":u
"let g:airline_theme='base16_spacemacs'
"let g:airline_theme='spacegray'
"let g:airline_theme='onehalfdark'
"let g:airline_theme='base16_gruvbox_dark_hard'
"let g:airline_theme='onedark'
"let g:airline_theme='onehalfdark'
"let g:airline_theme='tokyonight'
"let g:airline_theme='sonokai'
"let g:airline_theme='codedark'
"let g:airline_theme='tokyonight'
"let g:airline_theme='onedark'
"let g:airline_theme='gruvbox'


if has('python3')
endif

let g:NERDTreeLimitedSyntax = 1

set termguicolors

call plug#begin('~/vimfiles/plugged/')

Plug 'scrooloose/nerdcommenter'

"Plug 'preservim/NERDTree'

Plug 'vim-scripts/AutoComplPop'

"Plug 'wadackel/vim-dogrun'

" Plug 'whatyouhide/vim-gotham'

Plug 'jiangmiao/auto-pairs'

"Plug 'ryanoasis/vim-devicons'

"Plug 'morhetz/gruvbox'

"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Plug 'vim-airline/vim-airline'
"
" Plug 'vim-airline/vim-airline-themes'

Plug 'mattn/vimtweak'

"Plug 'derekmcloughlin/gvimfullscreen_win32'

"Plug 'mattn/transparency-windows-vim'

"Plug 'tsuyoshicho/transparency.vim'

"Plug 'endel/vim-github-colorscheme'

Plug 'joshdick/onedark.vim'

Plug 'vim-syntastic/syntastic'

Plug 'ervandew/supertab'

"Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

Plug 'sheerun/vim-polyglot'

"Plug 'vim-python/python-syntax'

"Plug 'dragfire/improved-syntax-highlighting-vim'

"Plug 'octol/vim-cpp-enhanced-highlight'

"Plug 'ctrlpvim/ctrlp.vim'

"Plug 'vim-scripts/Visual-Studio'

"Plug 'lifepillar/vim-solarized8'

"Plug 'siphalor/vim-atomified'

"Plug 'vim-scripts/darkgit.vim'

"Plug 'dracula/vim'

"Plug 'dunstontc/vim-vscode-theme'

"Plug 'vim-scripts/Visual-Studio'

"Plug 'sonph/onehalf'

"Plug 'crusoexia/vim-monokai'


"Plug 'heorhiy/visualstudiodark.vim'

"Plug 'vim-scripts/Blueshift'

"Plug 'hdima/python-syntax'

"Plug 'henrynewcomer/vim-theme-papaya'

"Plug 'chriskempson/tomorrow-theme'

"Plug 'geoffharcourt/one-dark.vim'

"Plug 'joshdick/onedark.vim'

"Plug 'mhinz/vim-startify'

"Plug 'sainnhe/sonokai'

"Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build' }

"Plug 'ryanoasis/powerline-extra-symbols'

"Plug 'vim-scripts/c.vim'

"Plug 'sainnhe/vim-color-forest-night'

"Plug 'tomasiser/vim-code-dark'

"Plug 'ghifarit53/tokyonight-vim'


"Plug 'alessandroyorba/despacio'

"Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Plug 'valloric/youcompleteme'

"Plug 'ajh17/spacegray.vim'

" Plug 'w0rp/ale'

"Plug 'kkoenig/wimproved.vim'

Plug 'mbbill/undotree'

Plug 'kien/ctrlp.vim'

call plug#end()


let g:ctrlp_working_path_mode = 'ra'

"let g:python_highlight_all = 1

" autocmd GUIEnter * silent! WToggleClean
" autocmd GUIEnter * silent! WSetAlpha 235
"
" map <F11> <Esc>:WToggleFullscreen<CR>
"
let  g:C_UseTool_cmake    = 'yes'
let  g:C_UseTool_doxygen = 'yes'
"let g:vimtweak_dll_path = 'H:\vim\vim82\vimtweak32.dll'

map <F11> <Esc>:call libcallnr("gvimfullscreen_64.dll", "ToggleFullScreen", 0)<CR>
set background=dark
"map <F11> <Esc>:call libcallnr("vimtweak64.dll", "EnableMaximize", 1)<CR>


map <F5> <Esc>:UndotreeToggle<CR>
set undodir=$HOME/.vim/undo-dir
set undofile 


"colorscheme dark_plus
"colorscheme gruvbox
"colorscheme everforest
"colorscheme tokyonight
"colorscheme dracula
"colorscheme sonokai
"colorscheme onehalfdark 
"colorscheme sonokai
"colorscheme everforest
"colorscheme codedark
"colorscheme VisualStudioDark
"colorscheme visualstudio
"colorscheme monokai
"colorscheme despacio
colorscheme onedark
"colorscheme spacegray
"colorscheme gruvbox
"colorscheme dogrun
"colorscheme gotham
"colorscheme atom

" "enable tabline
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ''
" let g:airline#extensions#tabline#left_alt_sep = ''
" let g:airline#extensions#tabline#right_sep = ''
" let g:airline#extensions#tabline#right_alt_sep = ''
"
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = "\uE0B8"    
"let g:airline#extensions#tabline#left_alt_sep = ''
"let g:airline#extensions#tabline#right_sep = "\uE0BA"  
"let g:airline#extensions#tabline#right_alt_sep = ''

" enable powerline fonts
"let g:airline_powerline_fonts = 1
"let g:airline_left_sep = ''
"let g:airline_right_sep = ''

" Switch to your current theme
"let g:airline_theme = 'base16_gruvbox_dark_hard'

"let g:airline_left_sep='>'
"let g:airline_right_sep='<'


" Always show tabs
set showtabline=2

" set cmdheight=1
"
" set noshowmode
"
" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
" endif
"
"   " powerline symbols
"
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" " "
" "let g:airline_left_sep = '\uE0B8'
" "let g:airline_left_alt_sep = ''
" "let g:airline_right_sep = '\uE0BA'
" "let g:airline_right_alt_sep = ''
" "let g:airline_left_sep = "\uE0B8"
" "let g:airline_right_sep = "\uE0BA"
"
" let g:airline_symbols.branch = ' '
" let g:airline_symbols.colnr = ' :'
" let g:airline_symbols.readonly = ' '
" let g:airline_symbols.linenr = ' :'
" let g:airline_symbols.maxlinenr = ' ☰ '
" let g:airline_symbols.dirty=' ⚡'
"


  " old vim-powerline symbols
  "let g:airline_left_sep = '⮀'
  "let g:airline_left_alt_sep = '⮁'
  "let g:airline_right_sep = '⮂'
  "let g:airline_right_alt_sep = '⮃'
  "let g:airline_symbols.branch = '⭠'
  "let g:airline_symbols.readonly = '⭤'
  "let g:airline_symbols.linenr = '⭡'



"  let g:startify_custom_header = [
            \ '                                                                                                 ',
            \ '                                                                            __                   ',
            \ '                                                                    __  __ /\_\    ___ ___       ',
            \ '                                                                   /\ \/\ \\/\ \ /'' __` __`\    ',
            \ '                                                                   \ \ \_/ |\ \ \/\ \/\ \/\ \    ',
            \ '                                                                    \ \___/  \ \_\ \_\ \_\ \_\   ',
            \ '                                                                     \/__/    \/_/\/_/\/_/\/_/   ',
            \ '                                                                                                 ',
            \ '                                                                                                 ',
            \ '                                                                                                 ', 
            \ ]

"let g:startify_padding_left = 50 " Hard coded padding for lists



"
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
"let g:syntastic_check_on_w = 1


"let g:syntastic_cpp_config_file = '.syntastic_cpp_config'
let g:syntastic_cpp_include_dirs = ['C:/SDL2/include']


let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = '-std=c++17'
let g:syntastic_cpp_check_header = 0
let g:syntastic_cpp_checkers = ['gcc']
"let g:syntastic_debug=1


nmap <C-d> :SyntasticToggleMode <CR>
nmap <C-c> :SyntasticCheck <CR>

" "colorscheme onedark
"
"


let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name




" " Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" " unicode characters in the file autoload/float.vim
" set encoding=utf-8
"
" " TextEdit might fail if hidden is not set.
" set hidden
"
" " Some servers have issues with backup files, see #649.
" set nobackup
" set nowritebackup
"
" " Give more space for displaying messages.
" "set cmdheight=1
"
" " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" " delays and poor user experience.
" set updatetime=300
"
" " Don't pass messages to |ins-completion-menu|.
" set shortmess+=c
"
" " Always show the signcolumn, otherwise it would shift the text each time
" " diagnostics appear/become resolved.
" if has("nvim-0.5.0") || has("patch-8.1.1564")
"   " Recently vim can merge signcolumn and number column into one
"   set signcolumn=number
" else
"   set signcolumn=yes
" endif
"
" "Use tab for trigger completion with characters ahead and navigate.
" "NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" "other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
"
" " Use <c-space> to trigger completion.
" if has('nvim')
"   inoremap <silent><expr> <c-space> coc#refresh()
" else
"   inoremap <silent><expr> <c-@> coc#refresh()
" endif
"
" " Make <CR> auto-select the first completion item and notify coc.nvim to
" " format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"
" " Use `[g` and `]g` to navigate diagnostics
" " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)
"
" " GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
"
" " Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>
"
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   elseif (coc#rpc#ready())
"     call CocActionAsync('doHover')
"   else
"     execute '!' . &keywordprg . " " . expand('<cword>')
"   endif
" endfunction
"
" " Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')
"
" " Symbol renaming.
" nmap <leader>rn <Plug>(coc-rename)
"
" " Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)
"
" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder.
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end
"
" " Applying codeAction to the selected region.
" " Example: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)
"
" " Remap keys for applying codeAction to the current buffer.
" nmap <leader>ac  <Plug>(coc-codeaction)
" " Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)
"
" " Map function and class text objects
" " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
" xmap if <Plug>(coc-funcobj-i)
" omap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap af <Plug>(coc-funcobj-a)
" xmap ic <Plug>(coc-classobj-i)
" omap ic <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)
"
" " Remap <C-f> and <C-b> for scroll float windows/popups.
" " if has('nvim-0.4.0') || has('patch-8.2.0750')
" "   nnoremap <silent><nowait><expr> <C-a> coc#float#has_scroll() ? coc#float#scroll(2) : "\<C-f>"
" "   nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" "   inoremap <silent><nowait><expr> <C-a> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
" "   inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
" "   vnoremap <silent><nowait><expr> <C-a> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
" "   vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" " endif
"
" " Use CTRL-S for selections ranges.
" " Requires 'textDocument/selectionRange' support of language server.
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)
"
" " Add `:Format` command to format current buffer.
" command! -nargs=0 Format :call CocAction('format')
"
" " Add `:Fold` command to fold current buffer.
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"
" " Add `:OR` command for organize imports of the current buffer.
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
"
" " Add (Neo)Vim's native statusline support.
" " NOTE: Please see `:h coc-status` for integrations with external plugins that
" " provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"
" " Mappings for CoCList
" " Show all diagnostics.
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
"
"
"
"
"
"

" == for nerd commenter == "
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1



filetype plugin on

"
" " == ycm config == "
"
"
" let g:ycm_python_interpreter_path = 'C:\Users\User\AppData\Local\Programs\Python\Python38\python.exe'
" "let g:ycm_python_sys_path = []
" let g:ycm_extra_conf_vim_data = [
"   \  'g:ycm_python_interpreter_path',
"   \  'g:ycm_python_sys_path'
"   \]
" let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'

" if findfile("Project.vim", ".") == "Project.vim"
"     source ./Project.vim
" endif



