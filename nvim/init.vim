" the prefix to use for leader commands
let mapleader="<space>"

call plug#begin('~/.vim/plugged')
" Color scheme
Plug 'morhetz/gruvbox'

" Status bar
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Line Numbers
Plug 'myusuf3/numbers.vim'

" Nerdtree
" ctrl m to open windows
Plug 'scrooloose/nerdtree'

" Vim Tmux Movement
" ctrl hjkl for movement between panes
Plug 'christoomey/vim-tmux-navigator'

" AutoImports
" <leader>i = import file 
Plug 'trotzig/import-js'

" Coc Vim
"
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'} " mru and stuff
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'} " color highlighting

call plug#end()

" Color scheme 
colorscheme gruvbox
set bg=dark
syntax on

let g:airline_theme='gruvbox'
set encoding=UTF-8

" Add extra whitespace on each line
set virtualedit+=onemore

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set expandtab
set backspace=indent,eol,start

" Different Cursors in Insert
:autocmd InsertEnter,InsertLeave * set cul!
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

" Remove Trailing Whitespace
autocmd BufWritePre * :%s/\s+$//e

" Nerdtree config
map <C-m> :NERDTreeToggle<CR>

" Emmet Config
let g:user_emmet_leader_key='<C-y>'

" Remap ESC to kj
inoremap kj <Esc>

" COC SETTINGs
inoremap <silent><expr> <c-space> coc#refresh()

" gd - go to definition of word under cursor
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)

" gi - go to implementation
nmap <silent> gi <Plug>(coc-implementation)

" gr - find references
nmap <silent> gr <Plug>(coc-references)

" gh - get hint on whatever's under the cursor
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> gh :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>
nnoremap <silent> <leader>cs  :<C-u>CocList -I symbols<cr>

" List errors
nnoremap <silent> <leader>cl  :<C-u>CocList locationlist<cr>

" list commands available in tsserver (and others)
nnoremap <silent> <leader>cc  :<C-u>CocList commands<cr>

" restart when tsserver gets wonky
nnoremap <silent> <leader>cR  :<C-u>CocRestart<CR>

" view all errors
nnoremap <silent> <leader>cl  :<C-u>CocList locationlist<CR>

" manage extensions
nnoremap <silent> <leader>cx  :<C-u>CocList extensions<cr>

" rename the current word in the cursor
nmap <leader>cr  <Plug>(coc-rename)
nmap <leader>cf  <Plug>(coc-format-selected)
vmap <leader>cf  <Plug>(coc-format-selected)

" run code actions
vmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction-selected)
