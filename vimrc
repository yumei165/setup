" This configuration file was tested with
" /usr/local/bin/vim (7.0) 
" /usr/local/bin/gvim (7.0)
"this line prevents copydotfiles from recopying: dot-vimrc_included
syntax on

"set for auto loading cpp.vim
filetype plugin indent on
set hidden
set switchbuf=usetab,newtab

set term=dtterm
set ru
set et
"set bs=indent,eol,start
set sw=4  "this is the level of autoindent, adjust to taste                 
set cin
"set foldmethod=indent

" Only use 256 colors on Linux machines.
" torte is better in 256 colors or gui.
" darkblue is better in 8 colors
if match($TERM, "xterm-256color") == 0
    set t_Co=256
    colorscheme torte
else
    colorscheme darkblue
endif

" GUI options
if has("gui_running")
   colorscheme desert
   set gfn=Monospace\ 16
   set lines=40 columns=83
endif

"highlight after 80 columns
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%80v.\+/

 " automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =
   
" Behavior for backspace
set backspace=indent,eol,start

" Highlight search
set hlsearch

"increament search
set incsearch

"case smart search
set ignorecase
set smartcase

" CTRL-V is Paste
"map <C-V>    "+gP
"imap <C-V>    <C-R>+
"cmap <C-V>    <C-R>+


source ~/.exrc


set tag=/bb/mbig/mbig2725/dlib/tags

cmap fb<Space> FuzzyFinderBuffer<CR>
cmap fd<Space> FuzzyFinderDir<CR>
cmap fr<Space> FuzzyFinderMruFile<CR>
cmap ff<Space> FuzzyFinderFile<CR>


" These are so that we do not have to use middle click
set clipboard=unnamed
vnoremap y "+y

"Tab Complete Commands
set wildmode=longest,list,full
set wildmenu

"" From ~vkohli/.vimrc
au BufRead,BufNewFile *.mf set filetype=ocaml
au BufRead,BufNewFile *.mfi set filetype=ocaml
au BufRead,BufNewFile *.mf set sw=2 et
au BufRead,BufNewFile *.mfi set sw=2 et
au BufRead,BufNewFile *.ml set sw=2 et
au BufRead,BufNewFile *.mli set sw=2 et
"
let g:ctrlp_map = '<c-p>'
"
"
function! Compile()
  if &filetype == 'ocaml'
    !/opt/swt/bin/ocamlbuild '%:t'
  else
    !compile_cmd '%:t:r'
  endif
endfunction

map <C-c> : call Compile() 

"" Omnicomplete stuff
filetype plugin on
set omnifunc=syntaxcomplete#Complete
au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

set completeopt=longest,menuone
:inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

inoremap <C-Space> <c-r>=InsertTabWrapper()<cr>

"split set up:move between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright


"indention set up
" size of a soft tabstop
set tabstop=4
" size of indent 
set shiftwidth=4
" always uses spaces instead of tab
set expandtab
set smarttab
" indentation inside namespace and classes
set cino=N-s,g0,:0
