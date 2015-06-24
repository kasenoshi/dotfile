" [  File  ] vimrc
" [ Author ] Asou Chang (aka Otis), <asouchang@gmail.com>
" [Revision] 33
" [Platform] Tested and Fully functional
"             - gvim/vim 7.3 on Arch Linux
"             - gvim/vim 7.3 on Windows 7
"             - MacVim Snapshot 65 (7.3.646) on Mac OS X 10.8
"            Tested and Partially functional 
"             - vim 7.3 on Mac OS X 10.7, 10.8

set directory=.,$TEMP

" Disable the vi command
set nocompatible

" Auto change the current directory to where the directory contains the file
set autochdir

" Autoindent
set ai 

" Smart indent (may cause incorrect indent of Ruby)
"set si " smartindent

" TAB related
set tabstop=4 " tabwidth
set shiftwidth=4 " shiftwidth
set expandtab " use space instead tab

" Set ruler for displaying the current cursor status on right-bottom corner
set ru "ruler

set confirm "prompt confirmation if user did ambiguity action (?)
"set foldmethod=syntax

set backspace=indent,eol,start
set whichwrap+=<,>,[,]

if has("autocmd")
    filetype plugin indent on
endif

if has("gui_running")
    set lines=36 columns=100
endif

" Windows Specific configuration
if has("win16") || has("win32") || has("win64") || has("win95")
    set fileencodings=ucs-bom,utf8,big5,cp950,latin1
    if has("gui_running")
        set guifont=Consolas:h12
        "set guifont=Courier\ New:h12
        "set guifont=Lucida\ Console:h12
    endif
endif

" Mac OS X Specific configuration
if has("mac") || has("macunix")
    set fileencodings=ucs-bom,utf8,big5,cp950,latin1
    " for macvim
    if has("gui_running")
        set guifont=Menlo\ Regular:h12
    endif
endif

" Smart Home
nnoremap <expr> <silent> <Home> (col('.') == matchend(getline('.'),'^\s*')+1 ? '0' : '^')
imap <silent> <Home> <C-o><Home>
" Smart End
"nnoremap <expr> <End> (col('.') == match(getline('.'), '\s*$') ? '$' : 'g_')
"imap <silent> <End> <C-o><End>

" Search term highlighting, <F2> on and off
set hlsearch "highlight search result
set incsearch "realtime search
nnoremap <F2> :set hls!<BAR>set hls?<CR>
inoremap <F2> <C-o>:set hls!<BAR>set hls?<CR>

" Syntax highlighting, <S-F2> on and off
syntax on
nnoremap <S-F2> :if exists("syntax_on")<BAR>syntax off<BAR>else<BAR>syntax on<BAR>endif<CR>
inoremap <S-F2> <C-o>:if exists("syntax_on")<BAR>syntax off<BAR>else<BAR>syntax on<BAR>endif<CR>

" Line Number, <F3> on and off
set nu "turn on line number
nnoremap <F3> :set nu!<BAR>set nu?<CR>
inoremap <F3> <c-O>:set nu!<BAR>set nu?<CR>

" Cursorcolumn highlighting, <F4> on and off
nnoremap <F4> :set cursorcolumn!<BAR>set cursorline?<CR>
inoremap <F4> <C-o>:set cursorcolumn!<BAR>set cursorline?<CR>

" Cursorline highlighting, <S-F4> on and off
set cursorline "highlight the line which cursor is currently located
nnoremap <S-F4> :set cursorline!<BAR>set cursorline?<CR>
inoremap <S-F4> <C-o>:set cursorline!<BAR>set cursorline?<CR>

" Spell check, <F7> on and off
set spelllang=en
nnoremap <F7> :set spell!<BAR>set spell?<CR>
inoremap <F7> <c-O>:set spell!<BAR>set spell?<CR>

" Make <Up> and <Down> moving the cursor among the line as displayed
inoremap <Up> <C-o>gk
inoremap <Down> <C-o>gj
nnoremap <Up> gk
nnoremap <Down> gj
vnoremap <Up> gk
vnoremap <Down> gj


" Shortcut for save or quit vim (JOE's own editor style)
nnoremap <F10> :w<CR>
inoremap <F10> <ESC>:w<CR>
nnoremap <C-K>s :w<CR>
nnoremap <C-K>S :w<CR>
nnoremap <C-K>c :q<CR>
nnoremap <C-K>C :q<CR>
nnoremap <C-C><C-C> :q<CR>

" Shortcut for Tab
nnoremap TT :tabnew<CR>:E<CR>
nnoremap TR :tabprevious<CR>
nnoremap TG :tabnext<CR>
nnoremap <C-Left> <C-PageUp>
nnoremap <C-Right> <C-PageDown>
inoremap <C-Left> <C-PageUp>
inoremap <C-Right> <C-PageDown>
vnoremap <C-Left> <C-PageUp>
vnoremap <C-Right> <C-PageDown>
nnoremap <C-Tab> <C-PageDown>
nnoremap <C-S-Tab> <C-PageUp>
inoremap <C-Tab> <C-PageUp>
inoremap <C-S-Tab> <C-PageDown>
vnoremap <C-Tab> <C-PageUp>
vnoremap <C-S-Tab> <C-PageDown>

" Never cancel the visual mode after change the indent
vnoremap > >gv
vnoremap < <gv
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Make Auto-completion be more like window-based IDEs
"inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<C-[>"
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<C-o>gj"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<C-o>gk"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

" The Following setting comes from the slate, and did some modification (2012/9/6)
set background=dark
highlight clear
if version > 580 
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
"let colors_name = "asou_slate"
hi Normal guifg=White guibg=grey15
hi Cursor guibg=green guifg=slategrey
hi VertSplit guibg=#c2bfa5 guifg=grey40 gui=none cterm=reverse
hi Folded guibg=black guifg=grey40 ctermfg=grey ctermbg=darkgrey
hi FoldColumn guibg=black guifg=grey20 ctermfg=4 ctermbg=7
hi IncSearch guifg=yellow1 guibg=black cterm=none ctermfg=yellow ctermbg=green
hi ModeMsg guifg=goldenrod cterm=none ctermfg=brown
hi MoreMsg guifg=SeaGreen ctermfg=darkgreen
hi NonText guifg=RoyalBlue guibg=grey15 cterm=bold ctermfg=blue
hi Question guifg=springgreen ctermfg=green
hi Search guibg=yellow3 guifg=black cterm=none ctermfg=grey ctermbg=blue
hi SpecialKey guifg=yellowgreen ctermfg=darkgreen
hi StatusLine guibg=#c2bfa5 guifg=black gui=none cterm=bold,reverse
hi StatusLineNC guibg=#c2bfa5 guifg=grey40 gui=none cterm=reverse
hi Title guifg=gold gui=bold cterm=bold ctermfg=yellow
hi Statement guifg=CornflowerBlue ctermfg=cyan cterm=bold gui=none
hi Visual gui=none guifg=khaki guibg=olivedrab cterm=reverse
hi WarningMsg guifg=salmon ctermfg=1
hi String guifg=SkyBlue ctermfg=darkcyan
hi Comment term=bold ctermfg=darkgreen guifg=green3
hi Constant guifg=#ffa0a0 ctermfg=brown
hi Special guifg=darkkhaki ctermfg=brown
hi Identifier guifg=salmon ctermfg=red
hi Include guifg=red ctermfg=red
hi PreProc guifg=red ctermfg=red
hi Operator guifg=Red ctermfg=Red
hi Define guifg=gold gui=bold ctermfg=yellow
hi Type guifg=CornflowerBlue ctermfg=2
hi Function guifg=navajowhite ctermfg=brown
hi Structure guifg=green ctermfg=green
hi Ignore guifg=grey40 cterm=bold ctermfg=7
hi Todo guifg=orangered guibg=yellow2
hi Directory ctermfg=darkcyan
hi ErrorMsg cterm=bold guifg=White guibg=Red cterm=bold ctermfg=7 ctermbg=1
hi VisualNOS cterm=bold,underline
hi WildMenu ctermfg=0 ctermbg=3
hi DiffAdd ctermbg=4
hi DiffChange ctermbg=5
hi DiffDelete cterm=bold ctermfg=4 ctermbg=6
hi DiffText cterm=bold ctermbg=1
hi Underlined cterm=underline ctermfg=5
hi Error guifg=White guibg=Red cterm=bold ctermfg=7 ctermbg=1
hi SpellErrors guifg=White guibg=Red cterm=bold ctermfg=7 ctermbg=1
""""""""""""""""""""""""""""""""""
" Change the pop-up menu's color "
""""""""""""""""""""""""""""""""""
hi Pmenu ctermfg=gray ctermbg=darkblue guibg=gray guibg=darkblue
hi PmenuSel ctermfg=yellow ctermbg=darkgreen gui=bold guibg=yellow guibg=darkgreen
hi PmenuSbar ctermbg=gray guibg=gray
hi PmenuThumb ctermbg=brown guibg=brown
"""""""""""""""""""""""""""""""""
" Change the cursorline's color "
"""""""""""""""""""""""""""""""""
" For cterm
hi CursorLineNr cterm=bold ctermbg=darkblue ctermfg=yellow
hi CursorLine cterm=NONE ctermbg=darkblue
hi CursorColumn cterm=NONE ctermbg=darkred
" For GUI
hi CursorLineNr gui=bold guibg=darkblue guifg=yellow
hi CursorLine guibg=darkblue
hi LineNr guibg=grey20 guifg=darkyellow
hi CursorColumn guibg=grey40
""""""""""""""""""""""""""""""""
" Change the Spell* color      "
""""""""""""""""""""""""""""""""
hi SpellBad cterm=reverse ctermbg=1 gui=undercurl guisp=Red
hi SpellCap cterm=reverse ctermbg=4 gui=undercurl guisp=Blue
hi SpellErrors cterm=bold,reverse ctermfg=7 ctermbg=1 guifg=White guibg=Red
hi SpellLocal cterm=underline,reverse ctermbg=6 gui=undercurl guisp=Cyan
hi SpellRare cterm=reverse ctermbg=5 gui=undercurl guisp=Magenta

