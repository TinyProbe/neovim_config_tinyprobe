" Vim Default Setting {{{
" Useful settings
set background=dark
set clipboard=unnamed,unnamedplus

"42Seoul common .vimrc base.
"Do not edit this file
"Put your own configuration options in ~/.myvimrc

"Activate indentation
filetype off
filetype plugin indent on
set smartindent

"Disable vi-compatibility
set nocompatible

"Real-world encoding
set encoding=utf-8

"Interpret modelines in files
set modelines=1

"Do not abandon buffers
set hidden

"Don't bother throttling tty
set ttyfast

"More useful backspace behavior
set backspace=indent,eol,start

"Use statusbar on all windows
set laststatus=2

"Better search
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

"Prevent backups when editing system files
augroup PreventPrivate
  autocmd!
  autocmd BufWrite /private/tmp/crontab.* set nowritebackup
  autocmd BufWrite /private/etc/pw.* set nowritebackup
augroup end

" Latest version .vimrc base file.
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Dec 17
"
" To use it, copy it to
"	       for Unix:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"	 for MS-Windows:  $VIM\_vimrc
"	      for Haiku:  ~/config/settings/vim/vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
" source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif
" }}}

" Options {{{
set splitbelow splitright
set ttimeoutlen=0
set wildmenu
set noshowmode
set autoread
set noautoindent
set smarttab
set expandtab
set title
set number
set relativenumber
set colorcolumn=80
set cursorline
set cursorcolumn
set mouse=a
set hlsearch
set incsearch
set nowrap
set nobackup
set undofile
set undodir=~/.cache/nvim/undo
set undolevels=4096
set noswapfile
set softtabstop=2
set tabstop=2
set shiftwidth=2
set scrolloff=6
set sidescrolloff=9
set termguicolors
set list
set listchars=tab:→·
set fillchars=eob:\ 
set foldmethod=marker

syntax on
colorscheme onehalfdark
" }}}

" Status-Line {{{
set statusline=\ NORMAL\ \ %n:\ %F%m\ %=\ %l:%c\ \ %P\ \ %L\ \ %Y\ 
highlight StatusLine guifg=#cbcbcd guibg=#116faf
augroup StatusLineCmd
  autocmd!
  autocmd ModeChanged *:n :set statusline=\ NORMAL\ \ %n:\ %F%m\ %=\ %l:%c\ \ %P\ \ %L\ \ %Y\ 
  autocmd ModeChanged *:i :set statusline=\ INSERT\ \ %n:\ %F%m\ %=\ %l:%c\ \ %P\ \ %L\ \ %Y\ 
  autocmd ModeChanged *:[vV\x16]* :set statusline=\ VISUAL\ \ %n:\ %F%m\ %=\ %l:%c\ \ %P\ \ %L\ \ %Y\ 
  autocmd ModeChanged *:s :set statusline=\ SELECT\ \ %n:\ %F%m\ %=\ %l:%c\ \ %P\ \ %L\ \ %Y\ 
  autocmd ModeChanged *:R :set statusline=\ REPLACE\ \ %n:\ %F%m\ %=\ %l:%c\ \ %P\ \ %L\ \ %Y\ 
  autocmd ModeChanged *:o :set statusline=\ O-PENDING\ \ %n:\ %F%m\ %=\ %l:%c\ \ %P\ \ %L\ \ %Y\ 
  autocmd ModeChanged *:c :set statusline=\ COMMAND\ \ %n:\ %F%m\ %=\ %l:%c\ \ %P\ \ %L\ \ %Y\ 
  autocmd ModeChanged *:t :set statusline=\ TERMINAL\ \ %n:\ %F%m\ %=\ %l:%c\ \ %P\ \ %L\ \ %Y\ 
  autocmd ModeChanged *:n :highlight StatusLine guibg=#116faf
  autocmd ModeChanged *:i :highlight StatusLine guibg=#588339
  autocmd ModeChanged *:[vV\x16]* :highlight StatusLine guibg=#86389d
  autocmd ModeChanged *:s :highlight StatusLine guibg=#86388d
  autocmd ModeChanged *:R :highlight StatusLine guibg=#a5803b
  autocmd ModeChanged *:o :highlight StatusLine guibg=#a02c35
  " autocmd ModeChanged *:c :highlight StatusLine guibg=#1676a2
  autocmd ModeChanged *:t :highlight StatusLine guibg=#1676a2
augroup end
" }}}

" Auto-Commands {{{
augroup BufDefault
  autocmd!
  autocmd BufNewFile * :write
  autocmd BufEnter *.c,*.cpp
        \ :setlocal cindent
        \ cinoptions=:s,l1,b1,g0,(s,us,U1,Ws,m1,j1,J1
        \ cinkeys+=*<ESC>,*<CR>,0=break;
        \|:nnoremap <Leader>/ mq0i//<ESC>`q
        \|:nnoremap <Leader>? mq^2xV=`q
        \|:vnoremap <Leader>/ mq:normal! 0i//<CR>`q
        \|:vnoremap <Leader>? mq:normal! ^2x<CR>gv=`q
augroup end
" }}}

" Key Mappings {{{
mapclear
let mapleader = " "
let maplocalleader = "\\"

noremap <C-q> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
nnoremap p <NOP>
nnoremap P <NOP>

nnoremap <Leader>co :edit ~/.config/nvim/init.vim<CR>
nnoremap <Leader>cr :source ~/.config/nvim/init.vim<CR>
nnoremap <Leader>fe :edit .<CR>
nnoremap <Leader>bs :buffers<CR>
nnoremap <Leader>bd :bdelete<CR>
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bp :bprevious<CR>
nnoremap <Leader>bh :bfirst<CR>
nnoremap <Leader>bl :blast<CR>
nnoremap <Leader>ts :tabs<CR>
nnoremap <Leader>tc :tabclose<CR>
nnoremap <Leader>tn :tabnext<CR>
nnoremap <Leader>tp :tabprevious<CR>
nnoremap <Leader>th :tabfirst<CR>
nnoremap <Leader>tl :tablast<CR>

nnoremap < <<
nnoremap > >>
vnoremap < <gv
vnoremap > >gv
vnoremap H <gv
vnoremap L >gv

nnoremap h <BackSpace>
nnoremap l <Space>
vnoremap h <BackSpace>
vnoremap l <Space>

nnoremap <C-q>q :xa<CR>
nnoremap <C-q>c :qa!<CR>
nnoremap <C-q>b :bdelete<CR>
nnoremap <C-q>w <C-w>c
nnoremap <C-q>t :tabclose<CR>

nnoremap gk gg0
nnoremap gj G0zz<C-y>
nnoremap gt H0
nnoremap gc M0
nnoremap gb L0
nnoremap gs _
nnoremap ge g_
nnoremap gh 0
nnoremap gl $
nnoremap gm gM
nnoremap gM gm
nnoremap gn :bnext<CR>zz
nnoremap gp :bprevious<CR>zz
vnoremap gk gg0
vnoremap gj G0zz<C-y>
vnoremap gt H0
vnoremap gc M0
vnoremap gb L0
vnoremap gs _
vnoremap ge g_
vnoremap gh 0
vnoremap gl $
vnoremap gm gM
vnoremap gM gm
vnoremap gn :bnext<CR>zz
vnoremap gp :bprevious<CR>zz

nmap <C-h> 3h
nmap <C-l> 3l
nnoremap <C-j> 3<C-e>
nnoremap <C-k> 3<C-y>
vmap <C-h> 3h
vmap <C-l> 3l
vnoremap <C-j> 3<C-e>
vnoremap <C-k> 3<C-y>

nnoremap piw viwP
nnoremap pp p
nnoremap PP P
vnoremap p P
vnoremap P p
vnoremap u <ESC>u
vnoremap U <ESC>u

nnoremap - <C-x>
nnoremap = <C-a>
nnoremap <C-a> GVgg
nnoremap <C-s> :wa<CR>
vnoremap J :m'>+<CR>gv
vnoremap K :m-2<CR>gv

onoremap i<Space> :<C-u>normal lBvE<CR>
vnoremap i<Space> :<C-u>normal lBvE<CR>
onoremap il :<C-u>normal _vg_<CR>
vnoremap il :<C-u>normal _vg_<CR>

vnoremap ms( s()<ESC>hpl%
vmap ms) ms(
vnoremap ms{ s{}<ESC>hpl%
vmap ms} ms{
vnoremap ms[ s[]<ESC>hpl%
vmap ms] ms[
vnoremap ms< s<><ESC>hp
vmap ms> ms<
vnoremap ms' s''<ESC>hp
vnoremap ms" s""<ESC>hp
vnoremap ms<Space> s  <ESC>hp

nmap mr( di(v%pgvms
nmap mr) mr(
nmap mr{ di{v%pgvms
nmap mr} mr{
nmap mr[ di[v%pgvms
nmap mr] mr[
nmap mr< di<vhpgvms
nmap mr> mr<
nmap mr' di'vhpgvms
nmap mr" di"vhpgvms
nmap mr<Space> di<Space>vhpgvms
" }}}

" Abbreviations {{{
iabbrev $<tiny>
      \ template <class T>
      \<NL>T const &min(T const &a, T const &b) {
      \<NL>return (a<b ? a : b);
      \<NL>}
      \<NL>template <class T>
      \<NL>T const &max(T const &a, T const &b) {
      \<NL>return (a>b ? a : b);
      \<NL>}
      \<NL>template <class T>
      \<NL>T __rand(T minimum, T maximum) {
      \<NL>static std::mt19937 generator((std::random_device())());
      \<NL>return (std::uniform_int_distribution<T>(minimum, maximum))(generator);
      \<NL>}

iabbrev $<html>
      \ <!DOCTYPE html>
      \<NL><html>
      \<NL><head>
      \<NL><charset="utf-8">
      \<NL><title>Hello World!</title>
      \<NL></head>
      \<NL><body>
      \<NL><h1>Hello World!</h1>
      \<NL></body>
      \<NL></html>
" }}}
