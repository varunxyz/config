"============= Custom shortcuts
""Set leader key
let mapleader = "'"

" Jump to end of line in insert modr
inoremap <C-e> <C-o>$

" Insert a blank line below
nnoremap <Leader>l o<Esc>d^<CR>

" goto short cut for bookmarks
noremap <C-g> `

"copy and paste a word
nnoremap <Leader>c viwy
nnoremap <Leader>v viwp
"=============================


au BufRead,BufNewFile *.yang set filetype=yang
au! Syntax yang source ~/.vim/yang.vim

au BufRead,BufNewFile *.cpp,*.cc,*.c,*.hpp,*.h set filetype=cpp
au! Syntax cpp source ~/.vim/google.vim

" au BufRead,BufNewFile *.adoc set filetype=asciidoc
" " source ~/.vim/asciidoc_filetype.vim
" " au! Syntax asciidoc source ~/.vim/asciidoc.vim
"
au BufRead,BufNewFile *.cmake,CMakeLists.txt set filetype=cmake
au! Syntax cmake source ~/.vim/cmake-syntax.vim
au! Syntax cmake source ~/.vim/cmake-indent.vim

"""Automatic reloading of RC file
autocmd! bufwritepost .vimrc source %

"""Saving
noremap <C-z> :update<CR>
vnoremap <C-z> <C-Z>:update<CR>
inoremap <C-z> <C-O>:update<CR>

""Needs to be at the beginnig before the tags are loaded
""set tags=~/.tags;,~/.vim/.vimtags
set tags=~/projects/rift/.git/tags;

"easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentationi

"" Sort the block
vnoremap <Leader>s :sort<CR>

" Show whitespace
" " MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/   

"Powerline
set rtp+=/net/ganga/home/vprasad/.local/lib/python3.3/site-packages/powerline/bindings/vim/
set laststatus=2

" Color scheme
" " mkdir -p ~/.vim/colors && cd ~/.vim/colors
" " wget -O wombat256mod.vim
" http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod  

"i Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on

" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

" Useful settings
set history=700
set undolevels=700

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" easier formatting of paragraphs, for docstring
vmap Q gq
nmap Q gqap

" " Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" " Disable stupid backup and swap files - they trigger too many events
" " for file system watchers
set nobackup
set nowritebackup
set noswapfile

" " Setup Pathogen to manage your plugins 
" " mkdir -p ~/.vim/autoload
" ~/.vim/bundle " curl -so ~/.vim/autoload/pathogen.vim
" https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
" " Now you can install any plugin into a .vim/bundle/plugin-name/ folder
call pathogen#infect()

" Better navigating through omnicomplete option list
" " See
" http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction
"
inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" Python specific
" Settings for ctrlp
" " cd ~/.vim/bundle
" " git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

noremap <C-r> :CtrlPBufTag<CR>
vnoremap <C-r> <C-Z>:CtrlPBufTag<CR>
inoremap <C-r> <C-O>:CtrlPBufTag<CR>

noremap <C-a> :CtrlPTag<CR>
vnoremap <C-a> <C-Z>:CtrlPTag<CR>
inoremap <C-a> <C-O>:CtrlPTag<CR>



" settings for jedi-vim
" cd ~/.vim/bundle
" " git clone git://github.com/davidhalter/jedi-vim.git
"let g:jedi#usages_command = "<leader>z"
"let g:jedi#popup_on_dot = 0
"let g:jedi#popup_select_first = 0
"map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

"cd ~/.vim/bundle
"git clone git://github.com/airblade/vim-gitgutter.git
let g:gitgutter_max_signs = 1000

"cd ~/.vim/bundle
"git clone https://github.com/scrooloose/nerdtree.git
"autocmd vimenter * NERDTree

"cd ~/.vim/bundle && \
"git clone https://github.com/scrooloose/syntastic.git
"

"Taglist: No longer using it
"https://github.com/vim-scripts/taglist.vim.git
"let Tlist_Use_Right_Window=1
"let Tlist_WinWidth = 40
"let TlistToggle=1

"vnoremap <C-r> :TlistOpen<CR>
"vnoremap <C-r> <C-Z>:TlistOpen<CR>
"inoremap <C-r> <C-O>:update<CR>

"https://github.com/christoomey/vim-tmux-navigator.git
" Window and pane operation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ALt mappings doesnt work :( so explicitly setting the mapping
"cat and get the sequenmce
"\e for escaope seq ^[:
execute "set <M-j>=\ej"
execute "set <M-k>=\ek"
" Also remove the escape key delay
" and ensure the escape delay is set to 0 in tmuz
set timeoutlen=1000 ttimeoutlen=0
noremap <M-j> gT
nnoremap <M-k> gt

"https://github.com/ervandew/supertab.git
"https://github.com/nvie/vim-flake8.git
let g:flake8_show_in_gutter=1
"https://github.com/heavenshell/vim-pydocstring.git
"https://github.com/tmhedberg/SimpylFold.git
