" Plugins
call plug#begin('~/vimfiles/plugged')

Plug 'AlessandroYorba/Alduin'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-sort-motion'
Plug 'dracula/vim'
Plug 'elzr/vim-json'
Plug 'ervandew/supertab'
Plug 'felixhummel/setcolors.vim'
Plug 'flazz/vim-colorschemes'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/goyo.vim'
Plug 'kien/ctrlp.vim'
Plug 'lambdalisue/vim-fullscreen'
Plug 'lepture/vim-jinja'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'
Plug 'pangloss/vim-javascript'
Plug 'pangloss/vim-javascript'
Plug 'python-mode/python-mode'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'sjl/gundo.vim'
Plug 'sonph/onehalf'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/CursorLineCurrentWindow'
Plug 'w0rp/ale'
Plug 'wesQ3/vim-windowswap'
Plug 'whatyouhide/vim-gotham'

call plug#end()

filetype plugin indent on

" Basic settings
set autoindent
set backup
set backupcopy=yes
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set expandtab
set nohlsearch
set incsearch
set lazyredraw
set shiftwidth=4
set showmatch
set t_co=256
set tabstop=4
set ttimeout
set ttimeoutlen=50
set vb t_vb=
set wildignore+=*\\tmp\\*,*\\.git\\*,*\\.hg\\*,*\\.svn\\*,*\\node_modules\\*,*.swp,*.zip,*.exe
set writebackup


" Rules and groups
augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC so $MYVIMRC | AirlineRefresh
augroup END

augroup ft_javascript
    au!

    au FileType javascript setlocal foldmethod=marker
    au FileType javascript setlocal foldmarker={,}

    " Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
    " positioned inside of them AND the following code doesn't get unfolded.
    au Filetype javascript inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>
    " }

    " Prettify a hunk of JSON with <localleader>p
    au FileType javascript nnoremap <buffer> <localleader>p ^vg_:!python -m json.tool<cr>
    au FileType javascript vnoremap <buffer> <localleader>p :!python -m json.tool<cr>
augroup END

highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Mappings
let mapleader = ';'
map <F3> :NERDTreeToggle C:\cygwin64\home\brett\LoudWay_APP<CR>
map <F4> :TagbarToggle<CR>
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nnoremap j gj
nnoremap k gk
nnoremap gV `[v`]
nnoremap <silent> <leader>h <C-w>h
nnoremap <silent> <leader>j <C-w>j
nnoremap <silent> <leader>k <C-w>k
nnoremap <silent> <leader>l <C-w>l
nnoremap <silent> <leader>g :Ggrep "
nnoremap <silent> <leader><leader>g :Goyo<CR>
nnoremap <silent> <leader><leader>V "*P
nnoremap <silent> <leader><leader>Y "*Y
nnoremap <silent> <leader><leader>v "*p
nnoremap <silent> <leader><leader>y "*y
nnoremap <silent> <leader>f :CtrlP C:\cygwin64\home\brett\LoudWay_APP<CR>
nnoremap <silent> <leader>a :CtrlPMixed<CR>
nnoremap <silent> <leader>b :CtrlPBuffer<CR>
nnoremap <silent> <leader>e :e $MYVIMRC<CR>
nnoremap <silent> <leader>i :PlugInstall<CR>
nnoremap <silent> <leader>q :bd<CR>
nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>u :GundoToggle<CR>
nnoremap <silent> <Space> za<CR>
vnoremap <Space> zf

set pastetoggle=<F2>

" UI options
colorscheme dracula
set cursorline
set encoding=utf-8
set guifont=FuraCode\ NF:h12
set guioptions -=L
set guioptions -=T
set guioptions -=m
set guioptions -=r
set laststatus=2
set nu
set relativenumber
syntax on

" Airline
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'c'  : 'C',
  \ 'v'  : 'V',
  \ 'V'  : 'V',
  \ '' : 'V',
  \ 's'  : 'S',
  \ 'S'  : 'S',
  \ '' : 'S',
  \ }
" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.whitespace = 'Ξ'

" Ctags
let g:tagbar_ctags_bin = '~/Downloads/ctags58/ctags.exe'

" Gitgutter
let g:gitgutter_enabled = 0
" indentLine
let g:indentLine_setColors = 1

" NERDTree
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = ['\.pyc$', '__pycache__', 'node_modules']

" Python mode
let g:pymode_options_max_line_length = 120
let g:pymode_options_colorcolumn = 0
let g:pymode_rope_lookup_project = 0
let g:pymode_rope = 0
let g:pymode_rope_complete_on_dot = 0

" Utilisnips
let g:UltiSnipsExpandTrigger="<c-p>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Youcompleteme
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_auto_trigger = 1
