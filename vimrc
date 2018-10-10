filetype off                  " required

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

Plug 'vim-airline/vim-airline'
Plug 'epilande/vim-es2015-snippets'
Plug 'epilande/vim-react-snippets'
Plug 'SirVer/ultisnips'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'mattn/emmet-vim'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
Plug 'w0rp/ale'
Plug 'mhartington/oceanic-next'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tacahiroy/ctrlp-funky'
Plug 'tpope/vim-surround'

call plug#end()

" change the mapleader from \ to ,
let mapleader=","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e ~/.vim/vimrc<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Key remappings
nnoremap ; :

"UltiSnips
let g:UltiSnipsExpandTrigger="<c-l>" "don't use tab is using ycm
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"Nerd Tree
let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>

"CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

"YouCompleteMe
" Start autocompletion after 4 chars
let g:ycm_min_num_of_chars_for_completion = 4
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_enable_diagnostic_highlighting = 0

"Emmet vim
let g:user_emmet_install_global = 0
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \      'quote_char': "'",
    \  },
  \}
autocmd FileType html,css,jsx,javascript.jsx EmmetInstall

"Ale / EsLint
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\}
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
nmap <leader>d <Plug>(ale_fix)

"vim-javascript
let g:javascript_plugin_flow = 1

"vim-jsx
let g:jsx_ext_required = 0

"Color Scheme
syntax enable

colorscheme OceanicNext

"Multiple cursors
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_start_word_key      = 'S'
let g:multi_cursor_next_key            = 'S'
let g:multi_cursor_skip_key            = 'K'
let g:multi_cursor_quit_key            = '<Esc>'

"Ctrlp funky
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>


"Other
set number relativenumber
set nowrap        " don't wrap lines
set tabstop=2     " a tab is two spaces
set backspace=indent,eol,start " allow backspacing over everything in insert mode
" todo remap esc On Mac OS X, with help of the software Karabiner, my caps lock key bound to ESC if I press and release. If i hold the same button it works as CTRL.
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set shiftwidth=2  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
"Search
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase, case sensitive otherwise
set smarttab      " insert tabs on the start of a line according to shiftwide, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set noswapfile

filetype plugin indent on
