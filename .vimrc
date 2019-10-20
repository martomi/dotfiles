
" ----- Start of Vundle Configuration ----- 

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-endwise' " Auto-adds end to certain structures
Plugin 'vim-airline/vim-airline' " Cool statusbar at the bottom
Plugin 'christoomey/vim-tmux-navigator' " Seemless navigation with tmux
Plugin 'tmhedberg/SimpylFold' " Proper code folding for Python
Plugin 'vim-scripts/indentpython.vim' " Proper auto-indent for Python
Plugin 'vim-syntastic/syntastic' " Check syntax on every save

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ----- End of Vundle Configuration ----- 

set encoding=utf-8 
set mouse=a " Enable mouse support
set ttymouse=xterm2 " Enables mouse support for pane resizing

" More intuitive backspace behaviour
set backspace=2 

" Linebreak on 200 characters
set lbr
set tw=119

" Tab = 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Follow PEP8 for Python
au BufNewFile,BufRead *.py set tabstop=4 shiftwidth=4 fileformat=unix

" UI/UX
set so=7 " At least 7 lines below/above cursor visible
set number " Display line numbers
set relativenumber " Makes it easier to jump +/- N lines from current
set ruler " Show current position on bottom right
set autoread " reload files when they change on disk (e.g., git checkout)

" Enable folding
set foldmethod=indent
set foldlevel=99

" More natural pane splitting
set splitbelow
set splitright

" Search
set hlsearch " Highlight search results
set incsearch " More responsive / modern searching experience
set ignorecase " Ignores case when searching
set smartcase " Tries to be smart about case

" Enable syntax highlighting
syntax on
highlight Comment ctermfg=green
highlight Folded ctermbg=Black ctermfg=magenta
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" if opening a file from :ls, :buffers, :files, etc. jump to open version
" of the file, if one exists
set switchbuf=useopen

" Press F7 to reindent the whole file
map <F7> gg=G<C-o><C-o>

" vv to generate new vertical split
nnoremap <silent> vv <C-w>v

" Press jk for Esc
imap jk <Esc>
imap kj <Esc>

" Enable folding with the spacebar
nnoremap <space> za

" Syntastic defaults
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_python_checkers = ['python', 'flake8'] " pip install flake8
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Sources:
" https://github.com/keeganlow/dotfiles/blob/master/.vimrc
