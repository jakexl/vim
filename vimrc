" Plugins {
call plug#begin('~/.vim/plugged')
  " GUI {
  Plug 'flazz/vim-colorschemes'
  " }
  " VCS {
  Plug 'tpope/vim-fugitive'
  " }
  " Languages {
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py --omnisharp-completer' }
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
set autoindent                 " Minimal automatic indenting for any filetype.
set backspace=indent,eol,start " Proper backspace behavior.
set hidden                     " Possibility to have more than one
                               " unsaved buffers.
set incsearch                  " Incremental search, hit '<CR>' to stop.
set ruler                      " Shows the current line number at the bottom.
                               " right of the screen.
set wildmenu                   " Great command-line completion, use '<Tab>' to
                               " move around and '<CR>' to validate.
set number

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
" }
" Key Mappings {
let mapleader="\<Space>"

noremap t j
noremap c k
noremap n l

noremap j t
noremap k c
noremap l n


nnoremap <leader>fed :e ~/.vim/vimrc<CR>

" }
" GUI {
set guifont=Hasklig-Light:h14
set lines=76
let g:molokai_original = 1
colorscheme molokai
" }
" Fugitive {
nnoremap <leader>gs :Gstatus<CR>
" }
" C# {
augroup csharp
	autocmd!
	autocmd FileType cs setlocal tabstop=4
	autocmd FileType cs setlocal softtabstop=4
	autocmd FileType cs setlocal shiftwidth=4
	autocmd FileType cs setlocal noexpandtab

  autocmd FileType cs nnoremap <f12> :YcmCompleter GoToDefinition<CR>
augroup END
" }
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker:
