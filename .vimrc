" vi:ft=vim:fdl=0:fdm=expr:fde=v\:lnum<11?0\:(getline(v\:lnum)=~'^\\s*$'&&getline(v\:lnum+1)=~'\\S'?'<1'\:1):
"
"   ░░    ░░ ░░ ░░░    ░░░ ░░░░░░   ░░░░░░
"   ▒▒    ▒▒ ▒▒ ▒▒▒▒  ▒▒▒▒ ▒▒   ▒▒ ▒▒
"   ▓▓    ▓▓ ▓▓ ▓▓ ▓▓▓▓ ▓▓ ▓▓▓▓▓▓  ▓▓
"    ██  ██  ██ ██  ██  ██ ██   ██ ██
" ██  ████   ██ ██      ██ ██   ██  ██████
"
" @author: thiagoalessio <thiagoalessio@me.com>
" @url: https://github.com/thiagoalessio/dotfiles

" general settings
set nocompatible
set noswapfile
set undofile undodir=~/.vim/undo
set backspace=indent,eol,start
set modeline modelines=2
set lazyredraw
filetype plugin indent on
syntax enable

" custom mappings/commands
vnoremap p "_dP
command! W w !sudo tee % >/dev/null
map <c-l> :set list!<cr>:set cursorcolumn!<cr>:RainbowLevelsToggle<cr>
map <F8> :TagbarToggle<cr>

" indentation
set autoindent
set noexpandtab
set tabstop=4 softtabstop=4 shiftwidth=4 shiftround
au FileType yaml,ruby setlocal et ts=2 sts=2 sw=2

" search
set incsearch hlsearch
set ignorecase smartcase

" spell check
set nospell spelllang=en_us
au FileType cucumber,gitcommit,mail,markdown,text setlocal spell

" folding
set foldenable foldcolumn=0

" interface
set splitright splitbelow
set number relativenumber
set list listchars=eol:$,tab:>-,trail:%
set showcmd showmode
set wildmenu
set nowrap
set noerrorbells novisualbell t_vb=
set cursorline cursorcolumn colorcolumn=78
set virtualedit=onemore

" colors
let base16colorspace=256
colorscheme base16-synth-midnight-dark
hi Normal ctermbg=none
hi NonText ctermbg=none

" statusline
set laststatus=2
set statusline=%t\ %m%r%h%w%=\ %{&ft}\ %{&ff}\ %{&fenc}\ %l,%v\ %L

" netrw
let g:netrw_liststyle=3
let g:netrw_banner=0

" diff mode
if &diff
	syntax off
	set norelativenumber
endif
if has("patch-8.1.0360")
	set diffopt+=internal,algorithm:patience
endif
