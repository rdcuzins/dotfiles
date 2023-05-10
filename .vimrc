" designed for vim 8+
let skip_defaults_vim=1
set nocompatible

"####################### Vi Compatible (~/.exrc) #######################

" automatically indent new lines
set autoindent
" automatically write files when changing when multiple files open
set autowrite
" activate line numbers
set number
" turn col and row position on in bottom right
set ruler " see ruf for formatting

" show command and insert mode
set showmode

set tabstop=2

"#######################################################################

set softtabstop=2
" used with >> and <<

set shiftwidth=2

set smarttab

if v:version >= 800
	" stop vim from messing with EOF
	set nofixendofline
	" better ascii friendly listchars
	 set listchars=space:*,trail:*,nbsp:*,extends:>,precedes:<,tab:\|>
	 set foldmethod=manual
	 set nofoldenable
endif

" mark trailing spaces as errors
match ErrorMsg '\s\+$'

set textwidth=72

" replace tabs with spaces
set expandtab

" disable relative line numbers
set norelativenumber

" enable spellchecker
" set spell

" cleaner files
set nobackup
set noswapfile
set nowritebackup

set icon
" highlight search hits
set hlsearch
set incsearch
set linebreak

" wrap when searching
set wrapscan

" command history
set history=100

" allow sensing the filetype
filetype plugin on

" colors
set background=dark

" ruler format
" set ruf=%30(%=%#LineNr#%.50F\ [%{strlen(&ft)?&ft:'none'}]\ %l:%c\ %p%%%)`

" better command-line completion
set wildmenu

" disable search highlighting with <C-L> when refreshing screen
nnoremap <C-L> :nohl<CR><C-L>

" function remap
map <F2> :set spell!<CR>

" Better page down and page up
noremap <C-n> <C-d>
noremap <C-p> <C-b>

" only load plugins if Plug detected
if filereadable(expand("~/.vim/autoload/plug.vim"))

  " github.com/junegunn/vim-plug

  call plug#begin('~/.local/share/vim/plugins')
  Plug 'sheerun/vim-polyglot'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'tpope/vim-vinegar'
  Plug 'valloric/youcompleteme'
  Plug 'habamax/vim-godot'
  Plug 'tpope/vim-commentary'
  Plug 'vim-pandoc/vim-pandoc'
  Plug 'rwxrob/vim-pandoc-syntax-simple'
  Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
  Plug 'tpope/vim-fugitive'
  Plug 'morhetz/gruvbox'
  Plug 'hashivim/vim-terraform'
  Plug 'rodjek/vim-puppet'
  call plug#end()

  autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
  autocmd InsertLeave * if pumvisible() == 0|pclose|endif
  " gruvbox
  " autocmd vimenter * ++nested colorscheme gruvbox
  " pandoc
  let g:pandoc#formatting#mode = 'h' " A'
  let g:pandoc#formatting#textwidth = 72

  " golang
  let g:go_fmt_fail_silently = 0
  let g:go_fmt_command = 'goimports'
  let g:go_fmt_autosave = 1
  let g:go_gopls_enabled = 1
  let g:go_highlight_types = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_function_calls = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_extra_types = 1
  let g:go_highlight_variable_declarations = 1
  let g:go_highlight_variable_assignments = 1
  let g:go_highlight_build_constraints = 1
  let g:go_highlight_diagnostic_errors = 1
  let g:go_highlight_diagnostic_warnings = 1
  let g:go_auto_type_info = 1 "can force 'Press ENTER' too much
  let g:go_auto_sameids = 0
  "let g:go_metalinter_command='golangci-lint'
  "let g:go_metalinter_command='golint'
  "let g:go_metalinter_autosave=1
  set updatetime=100
  "let g:go_gopls_analyses = { 'composites' : v:false }
  au FileType go nmap <leader>t :GoTest!<CR>
  au FileType go nmap <leader>v :GoVet!<CR>
  au FileType go nmap <leader>b :GoBuild!<CR>
  au FileType go nmap <leader>c :GoCoverageToggle<CR>
  au FileType go nmap <leader>i :GoInfo<CR>
  au FileType go nmap <leader>l :GoMetaLinter!<CR>
  "au filetype go inoremap <buffer> . .<C-x><C-o>
else
  autocmd vimleavepre *.go !gofmt -w % " backup if fatih fails
endif

au BufRead,BufNewFile *.pp set filetype=ruby
hi Normal guibg=NONE ctermbg=NONE
source /home/ricous/Repos/lsp-examples/vimrc.generated
func! GodotSettings() abort
    setlocal foldmethod=expr
    setlocal tabstop=4
    nnoremap <buffer> <F4> :GodotRunLast<CR>
    nnoremap <buffer> <F5> :GodotRun<CR>
    nnoremap <buffer> <F6> :GodotRunCurrent<CR>
    nnoremap <buffer> <F7> :GodotRunFZF<CR>
endfunc
augroup godot | au!
    au FileType gdscript call GodotSettings()
augroup end
