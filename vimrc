" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.

set nocompatible                  " Must come first because it changes other options.

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

runtime macros/matchit.vim        " Load the matchit plugin.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set fileformat=unix               " Set line endings to UNIX

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

" UNCOMMENT TO USE
set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Use industry colorscheme
colorscheme default

" Syntastic configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['jshint', 'jscs']

" Autostart language servers
let g:LanguageClient_autoStart = 1

" Configure JavaScript LSP for NeoVim
let g:LanguageClient_serverCommands = {}
if executable('javascript-typescript-stdio')
  let g:LanguageClient_serverCommands.javascript = ['javascript-typescript-stdio']
else
  echo "javascript-typescript-stdio not installed!\n"
  :cq
endif

" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

" Uncomment to use Jamis Buck's file opening plugin
"map <Leader>t :FuzzyFinderTextMate<Enter>

" Controversial...swap colon and semicolon for easier commands
"nnoremap ; :
"nnoremap : ;

"vnoremap ; :
"vnoremap : ;

" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby setlocal foldmethod=syntax
" autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2

" Vim-Plug section
call plug#begin('~/.vim/plugged')

" Use single-quotes for filepaths!

Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }                                         " Vim LSP client
Plug 'junegunn/fzf'
Plug 'roxma/nvim-completion-manager'
Plug 'ctrlpvim/ctrlp.vim'                     " CtrlP.vim fuzzy finder
Plug 'nikvdp/ejs-syntax'                      " EJS Syntax
Plug 'jelera/vim-javascript-syntax'           " JavaScript Syntax
Plug 'othree/javascript-libraries-syntax.vim' " JavaScript Library Syntax
Plug 'heavenshell/vim-jsdoc'                  " JSDoc Autogenerator
Plug 'guileen/vim-node-dict'                  " Node.js Dictionary
Plug 'moll/vim-node'                          " Node.js Syntax Highlighting
Plug 'vim-syntastic/syntastic'                " Syntastic
Plug 'godlygeek/tabular'                      " Tabular
Plug 'andreimaxim/vim-io'                     " Io Language
Plug 'posva/vim-vue'                          " Vue.js
Plug 'hail2u/vim-css3-syntax'                 " CSS syntax
Plug 'mattn/emmet-vim'                        " Emmet completion
Plug 'tpope/vim-fugitive'                     " Git wrapper
Plug 'airblade/vim-gitgutter'                 " Git diff gutter

call plug#end()
