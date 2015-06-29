" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:

let mapleader = "\<Space>"          " Space the new leader

" Plugin Vundle {
set nocompatible

filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.nvim/bundle/Vundle.vim
call vundle#begin('~/.nvim/bundle/')

Plugin 'gmarik/Vundle.vim'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-fugitive'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
Plugin 'tpope/vim-unimpaired'
Plugin 'Shougo/neomru.vim'

call vundle#end()
filetype plugin indent on
" }

" Plugin Latex-Box {

let g:LatexBox_quickfix = 1
let g:LatexBox_latexmk_preview_continuously=1
let g:LatexBox_latexmk_async=1
let g:LatexBox_latexmk_options = "-pvc -pdf -dvi-"
let g:LatexBox_build_dir = "target"
let g:LatexBox_Folding = 1
let g:PreviewBrowsers = "xdg-open"
" }
" Plugin Unite {
"
    " Use ag in unite grep source.
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts =
    \ '-i --line-numbers --nocolor --nogroup --hidden --ignore ' .
    \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
    let g:unite_source_grep_recursive_opt = ''

    " Explore buffers
    nnoremap <Leader>b :Unite -buffer-name=buffers -winheight=10 buffer<cr>
    " Explore files
    nnoremap <Leader>p :Unite -start-insert -buffer-name=files -winheight=10 file_rec/async<cr>
    " Explore recent files
    nnoremap <Leader>m :Unite -buffer-name=recent -winheight=10 file_mru<cr>
    nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>

    " mappings in the unite buffer (use c-j ck)
    autocmd FileType unite call s:unite_settings()
    function! s:unite_settings()
      " Enable navigation with control-j and control-k in insert mode
"      unmap <C-k>
      imap <buffer> <C-j>   <Plug>(unite_select_next_line)
      imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
    endfunction
" }
" ColorScheme {
    colorscheme hybrid
    set background=dark
    hi clear SpellBad
    hi SpellBad cterm=underline,bold ctermfg=red
    " Transparent background
    hi Normal ctermbg=none
    syntax on
" }
" Per file configuration {
" GIT {
au FileType gitcommit set fileencoding=utf8
set diffopt+=vertical
set scrolloff=10
" }
" Tex{

augroup TexConfig
    au FileType tex iab enfemería enfermería
    au FileType tex set conceallevel=0
augroup END
" Disable conceallevel (reemplazar letras por su versión formateada)
" }
" Vimwiki {
" See http://stackoverflow.com/questions/1313171/vim-combining-autocmd
augroup VimwikiAutowrite
    au FileType vimwiki set nobackup
    au FileType vimwiki set nowritebackup
    au FileType vimwiki set noswapfile
    au FileType vimwiki set autowrite
    au FocusLost *.wiki :w
    au FileType vimwiki set autowrite
augroup END

"}
" Markdown {
au FileType markdown set wrap
au FileType markdown set textwidth=80
au FileType markdown noremap <F5> :PreviewMarkdown<CR>
" }
" }
"Clipboard configuration {
    set clipboard=unnamed,unnamedplus
    imap <A-p> <Esc>p
"}
" General {

set virtualedit=onemore             " Allow for cursor beyond last character
set history=10000                   " Store a ton of history (default is 20)
set spell                           " Spell checking on
set spelllang=es,en
set hidden                          " Allow buffer switching without saving
set iskeyword-=.                    " '.' is an end of word designator
set iskeyword-=#                    " '#' is an end of word designator
set iskeyword-=-                    " '-' is an end of word designator
set splitright

set mouse=                          " Disable mouse
set shiftwidth=4                    " Use indents of 4 spaces
set expandtab                       " Tabs are spaces, not tabs
set tabstop=4                       " An indentation every four columns
set nolist                          " Hide not printable characters 
set softtabstop=4                   " Let backspace delete indent
set nopaste
set nonumber

set fileencodings=ucs-bom,utf8,prc
" }
" Maps útiles {
nnoremap K i<CR><Esc>

" Navegación {
imap jj <Esc><Esc><Esc>
imap jw <Esc>:w<CR>a
imap jk <Esc>:w<CR>
imap kj <Esc>:w<CR>
map gs :write<CR>
" }
" Resize options {
nnoremap <silent> <Leader>eh :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>rh :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>ev :exe "vertical resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>rv :exe "vertical resize " . (winheight(0) * 2/3)<CR>
" }
"Ejecuta el archivo actual con <leader>r {
nnoremap <leader>r :!%:p<CR>
command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>

" }

" }
