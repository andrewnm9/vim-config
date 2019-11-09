" init.vim
" based on a-good-vimrc

""" vundle {{{

set nocompatible                                        " required for Vundle
filetype off                                            " required for Vundle

set rtp+=~/.vim/bundle/Vundle.vim                       " add Vundle to runtime path
call vundle#begin()                                     " start Vundle

Plugin 'VundleVim/Vundle.vim'                           " let Vundle manage Vundle
Plugin 'morhetz/gruvbox'                                " install the best colorscheme

call vundle#end()                                       " stop Vundle
filetype plugin indent on                               " let plugins change indentation 

""" }}}
""" colors {{{
    
colorscheme gruvbox                                     " choose the best colorscheme
syntax enable                                           " allow syntax highlighting
set background=dark                                     " use a dark background

""" }}}
""" tabs and spaces {{{

set tabstop=4                                           " let visual tab be four spaces
set softtabstop=4                                       " make tab in edit mode be the same
set expandtab                                           " tabs are made of spaces

""" }}}
""" ui config {{{

set number                                              " we really need line numbers
set wildmenu                                            " turn on command autocomplete
set lazyredraw                                          " redraw only when we need to
set showmatch                                           " show matching [{()}]

""" }}}
""" searching {{{

set incsearch                                           " search while typing
set hlsearch                                            " highlight search terms
                                                        " turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

""" }}}
""" folding {{{

set foldenable                                          " use folds
set foldlevelstart=10                                   " open all folds
set foldnestmax=10                                      " at most ten folds
set foldmethod=indent                                   " fold on indentation
                                                        " use space to toggle
nnoremap <space> za

""" }}}
""" movement {{{
                                                        " move visually 
nnoremap j gj
nnoremap k gk
                                                        " use better start and end
nnoremap B ^
nnoremap E $
nnoremap ^ <nop>
nnoremap $ <nop>
                                                        " highlight last inserted
nnoremap gV `[v`]

""" }}}
""" leader {{{

let mapleader=","                                       " make comma the leader
                                                        " open or close gundo
nnoremap <leader>u :GundoToggle<CR>
                                                        " save this session
nnoremap <leader>s :mksession<CR>
                                                        " open silver searcher
nnoremap <leader>a :Ag

""" }}}
""" ctrlp {{{

let g:ctrlp_match_window = 'bottom,order:ttb'           " sort from top to bottom
let g:ctrlp_switch_buffer = 0                           " open new files in new buffers
let g:ctrlp_working_path_mode = 0                       " respect changed directory
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'   " use the silver searcher

""" }}}
""" tmux {{{

                                                        " change cursors in tmux
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

""" }}}
""" backups {{{

set backup                                              " allow backups
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp     " set backup directories
set backupskip=/tmp/*,/private/tmp/*                    " don't back up files here
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp     " set swap file directories
set writebackup                                         " allow backups during write

""" }}}
""" modelines {{{

set modelines=1                                         " allow modelines

""" }}}

" vim:foldmethod=marker:foldlevel=0