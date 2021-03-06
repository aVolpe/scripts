" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
language en_US

let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

let mapleader = " "          " Space the new leader
noremap K i<CR><Esc>
map <leader>dt :%s/\s\+$//g<CR>:w<CR>
set foldlevel=20

set undodir=~/.vimundo/
set undofile
"
"
" Plugins config {
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'


Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript', {'for': 'typescript.tsx'}
Plug 'w0ng/vim-hybrid'
Plug 'NLKNguyen/papercolor-theme'
Plug 'vimwiki/vimwiki'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdcommenter'
Plug 'aklt/plantuml-syntax'
Plug 'chrisbra/csv.vim'

call plug#end()
" }
" Useful configs {
set smartcase           " allows search to be case insensitive until a upper case appear
set scrolloff=3         " always show 3 lines under the cursor
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab " use a tab as four spaces 
set clipboard=unnamed

set fileencodings=ucs-bom,utf8,prc
set spell
set spelllang=es,en
set nospell
set history=10000
set mouse=                      " Disable mouse


"}
" Theme {
set background=dark
set termguicolors
colorscheme hybrid

function! ToggleSchema()
    if "dark" == &background
        set background=light
        colorscheme PaperColor
        set background=light
    else
        set background=dark
        colorscheme hybrid
        set background=dark
    endif
endfunction
nnoremap <F4> :call ToggleSchema()<CR>

function! FixColorscheme() " {
    "hi! clear SpellBad
    hi! SpellBad cterm=underline,bold ctermfg=none ctermbg=none

    hi! Visual ctermfg=240 ctermbg=250 guifg=white guibg=white
    
    " Transparent background
    hi! Normal ctermbg=none
    " Match pairing http://stackoverflow.com/questions/10746750/set-vim-bracket-highlighting-colors
    hi! MatchParen cterm=bold ctermbg=none ctermfg=magenta
endfunction

" }

"}
" Plugin: coc {
"
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
"set nobackup
"set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> <F2> <Plug>(coc-diagnostic-next)
nmap <silent> <S-F2> <Plug>(coc-diagnostic-prev)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
"nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd FileType typescript,json,typescript.tsx,css,scss setl foldmethod=syntax
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" }
" Plugin: Vimwiki {
"
let wikiroot              = '~/.dropbox_data/Dropbox/'
let wiki                  = {}
let wiki.path             = wikiroot . '/wiki/'
let wiki.path_html        = wikiroot . '/wiki_html/'
let wiki.auto_export      = 1
let wiki.nested_syntaxes  = {'python': 'python', 'c++': 'cpp', 'sql' : 'sql'}
let wiki.template_path    = wiki.path  . '/template/'
let wiki.template_default = 'default'
let wiki.template_ext     = '.htm'
let wiki.auto_toc         = 1

let g:vimwiki_list = [ wiki ]
let g:vimwiki_rxTableSep = '|'
let g:vimwiki_folding = 'expr'

augroup VimwikiAutowrite
    au FileType vimwiki set nobackup
    au FileType vimwiki set nowritebackup
    au FileType vimwiki set noswapfile
    au FileType vimwiki syntax on
    au FileType vimwiki set autowrite
    au FileType vimwiki set spell
    au FileType vimwiki hi clear SpellBad
    au FileType vimwiki hi SpellBad cterm=underline ctermfg=red
    au FileType vimwiki hi Visual term=reverse cterm=reverse guibg=Grey
    au FocusLost *.wiki :w
    au FileType vimwiki set expandtab
    au FileType vimwiki set tabstop=2
    au FileType vimwiki set softtabstop=2
    au FileType vimwiki set shiftwidth=2
    au FileType vimwiki setlocal number
    au FileType vimwiki setlocal relativenumber
    au FileType vimwiki AirlineRefresh
    au FileType * call FixColorscheme()
augroup END

" }
" Plugin: FZF {
nn <c-p> :Files<CR>

"}
" Plugin: NerdCommenter {

let g:NERDCustomDelimiters = {
  \ 'rest': { 'left': '# ' },
  \ 'puml': { 'left': "' " },
\ }

" }
"
set ic           " allows search to be case insensitive until a upper case appear
set smartcase           " allows search to be case insensitive until a upper case appear
