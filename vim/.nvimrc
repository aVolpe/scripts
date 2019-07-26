" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
language en_US

let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

let mapleader = "\<Space>"          " Space the new leader
"

" Plugin: dein {
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
   call dein#add('~/.cache/dein')

  " Add or remove your plugins here:
  call dein#add('flazz/vim-colorschemes')
  "call dein#add('Shougo/vimproc.vim',  {'build' : 'make'})
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-unimpaired')
  call dein#add('vimwiki/vimwiki')
  call dein#add('scrooloose/syntastic')
  call dein#add('godlygeek/tabular')
  call dein#add('scrooloose/nerdcommenter')

  "call dein#add('leafgarland/typescript-vim')
  "call dein#add('Quramy/tsuquyomi')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
      call dein#add('roxma/nvim-yarp')
      call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  call dein#add('Shougo/denite.nvim')

  call dein#add('Shougo/defx.nvim')
  if !has('nvim')
      call dein#add('roxma/nvim-yarp')
      call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#add('HerringtonDarkholme/yats.vim')
  call dein#add('mhartington/nvim-typescript', {'build': './install.sh'})

  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')

  call dein#add('tpope/vim-surround')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('mhinz/vim-startify')
  call dein#add('godlygeek/tabular')
  call dein#add('PProvost/vim-markdown-jekyll')
  call dein#add('tacahiroy/ctrlp-funky')

  " Required:
  call dein#end()
  call dein#save_state()
endif

let g:deoplete#enable_at_startup = 1
" Required:
filetype plugin indent on
syntax enable

" } End dein Scripts-------------------------
" Plugin: ctrp {
let g:ctrlp_match_window = 'bottom,order:ttb,min:5,max:10,results:10'
"let g:ctrlp_extensions = ['funky', 'yankring']
let g:ctrlp_extensions = ['funky']
" }
" Plugin: ctrp-funky {
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_funky_use_cache = 1
nnoremap <Leader>fu :CtrlPFunky<Cr>
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
" }
" Plugin: Syntastic {

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_java_checkers = ['']

let g:airline#extensions#syntastic#enabled = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" }
" Plugin: Tabular {
" 
" nmap <Leader>a& :Tabularize /&<CR>
" vmap <Leader>a& :Tabularize /&<CR>
" nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
" vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
" nmap <Leader>a=> :Tabularize /=><CR>
" vmap <Leader>a=> :Tabularize /=><CR>
" nmap <Leader>a: :Tabularize /:<CR>
" vmap <Leader>a: :Tabularize /:<CR>
" nmap <Leader>a:: :Tabularize /:\zs<CR>
" vmap <Leader>a:: :Tabularize /:\zs<CR>
" nmap <Leader>a, :Tabularize /,<CR>
" vmap <Leader>a, :Tabularize /,<CR>
" nmap <Leader>a,, :Tabularize /,\zs<CR>
" vmap <Leader>a,, :Tabularize /,\zs<CR>
" nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
" vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
" }
" Plugin: Startify {
"" Cabecera y pie:

function! s:filter_header(lines) abort
    let longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
    let centered_lines = map(copy(a:lines),
                \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
    return centered_lines
endfunction

let g:startify_custom_header = s:filter_header(map(split(system('fortune | cowsay -f $(ls /usr/local/Cellar/cowsay/3.04/share/cows/*.cow | gshuf -n1) | lolcat'), '\n'), '"   ". v:val')) 

let g:startify_bookmarks = [ '~/.vimrc.local','~/.vimrc.bundles.local' ]
autocmd User Startified setlocal cursorline
let g:startify_skiplist = [
            \ 'COMMIT_EDITMSG',
            \ '.vimrc.local',
            \ '.vimrc.bundles.local'
            \ ]
"" Tema
highlight StartifyBracket ctermfg=240
highlight StartifyFooter  ctermfg=114
highlight StartifyHeader  ctermfg=114
highlight StartifyNumber  ctermfg=215
highlight StartifyPath    ctermfg=245
highlight StartifySlash   ctermfg=240
highlight StartifySpecial ctermfg=240

" }
" Plugin: NerdCommenter {

let g:NERDCustomDelimiters = {
            \ 'rest': { 'left': '# ' },
            \ }

" }
" Plugin: Ctrlp {
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" }
" Plugin: Airline {
let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1

let g:airline_theme='badwolf'
let g:airline_powerline_fonts = 1


let g:indent_guides_enable_on_vim_startup = 0

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_detect_spell=0
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


call airline#parts#define_raw('linenr', '%l')
call airline#parts#define_raw('linet', '%L')
call airline#parts#define_accent('linenr', 'bold')
call airline#parts#define_accent('linet', 'bold')
"let g:airline_section_a = airline#section#create('')
let g:airline_section_b = airline#section#create('')
let g:airline_section_y = airline#section#create('')
let g:airline_section_z = airline#section#create(['%3p%% ', 'linenr', '/', 'linet', ':%c'])
" }
" ColorScheme {
colorscheme hybrid
set background=dark
hi clear SpellBad
hi SpellBad cterm=underline,bold ctermfg=red
" Transparent background
hi Normal ctermbg=none
hi Visual term=reverse cterm=reverse guibg=Grey

set cursorline
" }
" Per file configuration {
" GIT {
au FileType gitcommit set fileencoding=utf8
set diffopt+=vertical
set scrolloff=10
" }
" Tex{

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

let wikiroot = '~/.dropbox/Dropbox/'
let wiki = {}
let wiki.path = wikiroot . '/wiki/'
let wiki.path_html = wikiroot . '/wiki_html/'
let wiki.auto_export = 1
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'sql' : 'sql'}
let wiki.template_path = wiki.path  . '/template/'
let wiki.template_default = 'default'
let wiki.template_ext = '.htm'

let g:vimwiki_list = [ wiki ]
let g:vimwiki_rxTableSep = '|'
let g:vimwiki_folding = 'expr'
"}

" Markdown {
au FileType markdown set wrap
au FileType markdown set textwidth=80
au FileType markdown noremap <F5> :PreviewMarkdown<CR>
" }
" JavaScript {
au FileType js set shiftwidth=2
au FileType typescript set shiftwidth=4
" }
au BufRead,BufNewFile .vrapperrc setfiletype vim
" }
"Clipboard configuration {
set clipboard=unnamed,unnamedplus
imap <A-p> <Esc>p
"}
" General {

set langmenu=en_US
set virtualedit=onemore             " Allow for cursor beyond last character
set history=10000                   " Store a ton of history (default is 20)
set spell                           " Spell checking on
set spelllang=es,en
set hidden                          " Allow buffer switching without saving
set iskeyword-=.                    " '.' is an end of word designator
set iskeyword-=#                    " '#' is an end of word designator
set iskeyword-=-                    " '-' is an end of word designator
set splitright
set splitbelow
set autochdir

set mouse=                          " Disable mouse
set shiftwidth=4                    " Use indents of 4 spaces
set expandtab                       " Tabs are spaces, not tabs
set tabstop=4                       " An indentation every four columns
set nolist                          " Hide not printable characters
set softtabstop=4                   " Let backspace delete indent
set nopaste
set nonumber
set ignorecase

set fileencodings=ucs-bom,utf8,prc

" Undo {
set undodir=~/.nvimundo
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload
" }
" Maps útiles {
nnoremap K i<CR><Esc>

" Navegación {
set pastetoggle=<F12>
imap jj <Esc><Esc><Esc>
imap jw <Esc>:w<CR>a
imap jk <Esc>:w<CR>
imap kj <Esc>:w<CR>
map gs :write<CR>
autocmd FileType typescript nnoremap <buffer> <C-]> :TSDef<CR>
autocmd FileType typescriptreact nnoremap <buffer> <C-]> :TSDef<CR>

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
