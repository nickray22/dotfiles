set nocompatible
colorscheme inkpot
syntax enable
set showcmd
set title
set smarttab
set ai
set si
set wrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set number
set showmatch
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set autoread
map <Esc><Esc> :wq<CR>
set history=700
set so=999
set ruler
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set autoindent
" add # comment with K
noremap K :s,^\(#\)\=,#,e <BAR> nohls<CR>j
" remove // comment with CTRL+K
noremap <C-K> :s,^#,,e <BAR> nohls<CR>j
filetype plugin indent on
filetype plugin on
execute pathogen#infect()
au BufNewFile *.sh 0r ~/scripts/bash_template.sh
imap jj <Esc>
" stops autocomplete comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" open nerdtree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>
map <C-f> :NERDTreeFocus<CR>
