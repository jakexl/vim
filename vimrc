" Plugins {
call plug#begin('~/.vim/plugged')
  " Improve {
  " Plug 'tpope/vim-surround'
  " }
  " GUI {
  Plug 'flazz/vim-colorschemes'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " }
  " Navigation {
  Plug 'scrooloose/nerdtree'
"  Plug 'wincent/command-t', {
"    \   'do': 'cd ruby/command-t && /usr/bin/ruby extconf.rb && make'
"    \ }

  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'mileszs/ack.vim'
  " }
  " VCS {
  Plug 'tpope/vim-fugitive'
  " }
  " Languages {
  Plug 'vim-syntastic/syntastic'
  Plug 'tpope/vim-commentary'
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py --omnisharp-completer' }
  Plug 'oranget/vim-csharp'

  Plug 'elixir-lang/vim-elixir'
  Plug 'slashmili/alchemist.vim'
  " }
call plug#end()

filetype plugin indent on
syntax enable

" }
" Basic Settings {
" 'matchit.vim' is built-in so let's enable it!
" Hit '%' on 'if' to jump to 'else'.
runtime macros/matchit.vim

" various settings
set macligatures
set autoindent                 " Minimal automatic indenting for any filetype.
set backspace=indent,eol,start " Proper backspace behavior.
set hidden                     " Possibility to have more than one
                               " unsaved buffers.
set incsearch                  " Incremental search, hit '<CR>' to stop.
" set ruler                      " Shows the current line number at the bottom.
                               " right of the screen.
set wildmenu                   " Great command-line completion, use '<Tab>' to
                               " move around and '<CR>' to validate.
set number
set colorcolumn=100

set ignorecase
set smartcase

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
" }
" Key Mappings {
let mapleader="\<Space>"

noremap d h
noremap h j
noremap t k
noremap n l

noremap j t
noremap k d
noremap l n

nnoremap <leader>fed :e ~/.vim/vimrc<CR>
nnoremap <f4> :cnext<CR>
nnoremap <S-F4> :cprevious<CR>
" }
" Auto Commands {
set autowriteall
augroup my_commands
  autocmd!
  autocmd FocusLost * silent! :wa
augroup END
" }
" GUI {
set guifont=Hasklig-Light:h14
set lines=76
let g:molokai_original = 1
colorscheme molokai
" }
" Airline {
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='molokai'
" }
" Fugitive {
nnoremap <leader>gs :Gstatus<CR>
" }
" NERD tree {
nnoremap <leader>ft :NERDTree<CR>
" }
" Command-T or CtrlP {
set wildignore+=artwork/*,*/ios/*,*.meta,*/_build/*,*/deps/*,*.mat,*.anim,*.prefab,*.png,*.FBX,*.ico,.DS_Store,*.dll,*.mp3
let g:CommandTMaxFiles=200000

let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_max_files=200000
let g:ctrlp_by_filename=1
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_user_command = 'git ls-files %s'
let g:ctrlp_custom_ignore = {
  \ 'dir': 'artwork',
  \ 'file': '\.png$'
  \ }


" }
" Ag {
let g:ackprg = 'ag --vimgrep'
" }
" Syntastic {
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" }
" C# {
function! cs#get_net_compiler(compiler)
  return "xbuild"
endfunction

function! cs#find_net_solution_file()
  return "~/work/q5/program/Unity/Unity.sln"
endfunction

augroup csharp
  autocmd!
  autocmd FileType cs setlocal tabstop=4
  autocmd FileType cs setlocal softtabstop=4
  autocmd FileType cs setlocal shiftwidth=4
  autocmd FileType cs setlocal noexpandtab
  autocmd FileType cs setlocal makeprg=xbuild\ /nologo\ /verbosity:quiet\ /property:GenerateFullPaths=true

  autocmd FileType cs nnoremap <f9> :make <bar> copen<CR>
  autocmd FileType cs nnoremap <f12> :YcmCompleter GoToDefinition<CR>
  autocmd FileType cs nnoremap <leader>/ :Ack  **/*.cs<Left><Left><Left><Left><Left><Left><Left><Left>
augroup END
" }
" Elixir {
augroup elixir
  autocmd!
  autocmd FileType elixir setlocal makeprg=mix\ test\ --no-color
  autocmd FileType elixir setlocal errorformat=
  \%E\ \ %n)\ %m,
  \%+G\ \ \ \ \ **\ %m,
  \%+G\ \ \ \ \ stacktrace:,
  \%C\ \ \ \ \ %f:%l,
  \%+G\ \ \ \ \ \ \ (%\\w%\\+)\ %f:%l:\ %m,
  \%+G\ \ \ \ \ \ \ %f:%l:\ %.%#,
  \**\ (%\\w%\\+)\ %f:%l:\ %m

  autocmd FileType elixir nnoremap <F9> :lcd ~/work/q5/program/server/apps/world_server<bar> make <bar> copen<CR>
  autocmd FileType elixir nnoremap <f12> <C-]>
augroup END
" }
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker:
