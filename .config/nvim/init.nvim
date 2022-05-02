" Options
"set background=dark  " apply the color set for dark screens
set number  " show line numbers
"set relativenumber  "show line numbers starting from the current oneset autoindent
set mouse=a  " allows the use of the mouse in the editorset clipboard=unnamedplus
set completeopt=noinsert,menuone,noselect
set splitbelow splitright  " screens will always split below the current screen and to the rightset title
set hidden  " hide unused buffersset inccommand=split
set showcmd  " Show partial command you type in the last line of the screen.
set showmode  " Show the mode you are on the last line.
set showmatch
set hlsearch  " Highlighting when doing a search. nohlsearch or hlsearch
set history=1000  " Set the commands to save in history default number is 20.
set title  " show the file title
set wildmenu  " show a more advanced menu for auto-completion suggestions
":colorscheme monokai

" Tabs size
set smarttab
set expandtab  " transforms tabs into soaces
set shiftwidth=2  " number of spaces fpr indention
set tabstop=2  " number of soaces for tabs
set softtabstop=2

" add automatic syntax suppoert for open files
filetype plugin indent on
syntax on
set t_Co=256i  " enable 256 colors on the terminal

" Italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"


set cursorline  " Turn on cursor line
set matchpairs+=<:>  " Highlight matching pairs of brackets. Use the '%' character to jump between them.

" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Plugins======================================

call plug#begin('~/.config/nvim/plugged')

  " == Themes =====================
  Plug 'elvessousa/sobrio'
  Plug 'morhetz/gruvbox'
  Plug 'sainnhe/edge'
  " == Plugin =====================
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  
  let g:airline_theme='sobrio'
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
 
call plug#end()
 
:colorscheme edge 
