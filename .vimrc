" This is Gary Bernhardt's .vimrc file
" vim:set ts=2 sts=2 sw=2 expandtab:

autocmd!

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC EDITING CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
" allow unsaved background buffers and remember marks/undo for them
set hidden
" remember more commands and search history
set history=10000
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set laststatus=2
set showmatch
set incsearch
set hlsearch
" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase
" highlight current line
set cursorline
set cmdheight=1
set switchbuf=useopen
set showtabline=2
set winwidth=83
" This makes RVM work inside Vim. I have no idea why.
set shell=bash
" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=
" keep more context when scrolling off the end of a buffer
set scrolloff=3
" Store temporary files in a central spot
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" display incomplete commands
set showcmd
" Enable highlighting for syntax
syntax on
" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on
" use emacs-style tab completion when selecting files, etc
set wildmode=longest,list
" make tab completion for files/buffers act like bash
set wildmenu
let mapleader=" "
" Fix slow O inserts
:set timeout timeoutlen=1000 ttimeoutlen=100
" Normally, Vim messes with iskeyword when you open a shell file. This can
" leak out, polluting other file types even after a 'set ft=' change. This
" variable prevents the iskeyword change so it can't hurt anyone.
let g:sh_noisk=1
" Modelines (comments that set vim options on a per-file basis)
set modeline
set modelines=3
" Turn folding off for real, hopefully
set foldmethod=manual
set nofoldenable
" Insert only one space when joining lines that contain sentence-terminating
" punctuation like `.`.
set nojoinspaces
" If a file is changed outside of vim, automatically reload it without asking
set autoread
set nu
set rnu
set colorcolumn=80
set shortmess+=A
set encoding=utf-8

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set nocompatible
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugin 'Valloric/YouCompleteMe'
" Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tomtom/tcomment_vim'
Plugin 'mileszs/ack.vim'
" Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/ruby-matchit'
Plugin 'jgdavey/tslime.vim'
Plugin 'SirVer/ultisnips'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
" Plugin 'stefanoverna/vim-i18n'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'vim-ruby/vim-ruby'
Plugin 'slim-template/vim-slim'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'benmills/vimux'
Plugin 'tpope/vim-bundler'
Plugin 'lordm/vim-browser-reload-linux'
Plugin 'Lokaltog/vim-easymotion'
" Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
" Plugin 'kbarrette/mediummode'
" Plugin 'scrooloose/syntastic'
Plugin 'neomake/neomake'
Plugin 'jplaut/vim-arduino-ino'
Plugin 'mustache/vim-mustache-handlebars'
" Plugin 'JarrodCTaylor/vim-ember-cli-test-runner'
" Plugin 'jiangmiao/auto-pairs'
Plugin 'jaymiejones86/vim-capybara'
Plugin 'kana/vim-textobj-entire'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'
Plugin 'christoomey/vim-system-copy'
Plugin 'KabbAmine/zeavim.vim'
" Plugin 'thanthese/Tortoise-Typing'
Plugin 'AndrewRadev/ember_tools.vim'
Plugin 'galooshi/vim-import-js'
Plugin 'ngmy/vim-rubocop'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'stefandtw/quickfix-reflector.vim'
Plugin 'haya14busa/incsearch.vim'
Plugin 'haya14busa/incsearch-easymotion.vim'
Plugin 'haya14busa/incsearch-fuzzy.vim'
Plugin 'mattn/ctrlp-mark'
Plugin 'morhetz/gruvbox'
" Plugin 'wellle/tmux-complete.vim'
Plugin 'kassio/neoterm'
Plugin 'BurningEther/nvimux'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'xtal8/traces.vim'
Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'roxma/nvim-yarp'
" Plugin 'ternjs/tern_for_vim'
" Plugin 'carlitux/deoplete-ternjs'
" Plugin 'uplus/deoplete-solargraph'
" Plugin 'natebosch/vim-lsc'
Plugin 'autozimu/LanguageClient-neovim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM AUTOCMDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufWritePre * :%s/\s\+$//e
augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!
  autocmd FileType text setlocal textwidth=78
  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  "for ruby, autoindent with two spaces, always expand tabs
  autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et
  autocmd FileType python set sw=2 sts=2 et

  autocmd! BufRead,BufNewFile *.sass setfiletype sass

  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
  autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;

  " Don't syntax highlight markdown because it's often wrong
  autocmd! FileType mkd setlocal syn=off

  " *.md is markdown
  autocmd! BufNewFile,BufRead *.md setlocal ft=

  autocmd BufWritePost,BufRead * Neomake
  autocmd BufWritePost * :call system('ctags -Ra -f .git/tags --languages=ruby --exclude=.git --exclude=log ' . expand("%") . ' &')
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :set t_Co=256 " 256 colors
:set background=dark
" :set termguicolors
let g:gruvbox_contrast_light='hard'
let g:gruvbox_contrast_dark='hard'
" let g:solarized_termcolors=256
:colorscheme gruvbox

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:set statusline=%<%{pathshorten(expand('%:f'))\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC KEY MAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>y "+y
map <leader>p "+p
" Move around splits with <c-hjkl>
" nnoremap <c-right> <c-w>h
" nnoremap <c-down> <c-w>j
" nnoremap <c-up> <c-w>k
" nnoremap <c-left> <c-w>l
" nnoremap <c-w>s :split<cr>
" Can't be bothered to understand ESC vs <c-c> in insert mode
imap <c-c> <esc>
nnoremap <Leader>w :w<cr>
cnoremap w!! w !sudo tee > /dev/null %

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-n>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-p>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPEN FILES IN DIRECTORY OF CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PROMOTE VARIABLE TO RSPEC LET
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>rp :PromoteToLet<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EXTRACT VARIABLE (SKETCHY)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ExtractVariable()
    let name = input("Variable name: ")
    if name == ''
        return
    endif
    " Enter visual mode (not sure why this is needed since we're already in
    " visual mode anyway)
    normal! gv

    " Replace selected text with the variable name
    exec "normal c" . name
    " Define the variable on the line above
    exec "normal! O" . name . " = "
    " Paste the original selected text to be the variable value
    normal! $p
endfunction
vnoremap <leader>rv :call ExtractVariable()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INLINE VARIABLE (SKETCHY)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InlineVariable()
    " Copy the variable under the cursor into the 'a' register
    :let l:tmp_a = @a
    :normal "ayiw
    " Delete variable and equals sign
    :normal 2daW
    " Delete the expression into the 'b' register
    :let l:tmp_b = @b
    :normal "bd$
    " Delete the remnants of the line
    :normal dd
    " Go to the end of the previous line so we can start our search for the
    " usage of the variable to replace. Doing '0' instead of 'k$' doesn't
    " work; I'm not sure why.
    normal k$
    " Find the next occurence of the variable
    exec '/\<' . @a . '\>'
    " Replace that occurence with the text we yanked
    exec ':.s/\<' . @a . '\>/' . escape(@b, "/")
    :let @a = l:tmp_a
    :let @b = l:tmp_b
endfunction
nnoremap <leader>ri :call InlineVariable()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SWITCH BETWEEN TEST AND PRODUCTION CODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction
function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = (match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<workers\>') != -1 || match(current_file, '\<views\>') != -1 || match(current_file, '\<helpers\>') != -1) || match(current_file, '\<services\>') != -1 && match(current_file, '\<lib\>') == -1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    let new_file = substitute(new_file, '\.e\?rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    end
  endif
  return new_file
endfunction
nnoremap <leader>. :call OpenTestAlternate()<cr>


nnoremap <leader>Q :cc<cr>
nnoremap <leader>j :cnext<cr>
nnoremap <leader>k :cprev<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPS TO JUMP TO SPECIFIC COMMAND-T TARGETS AND FILES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>gr :topleft :split config/routes.rb<cr>
function! ShowRoutes()
" Requires 'scratch' plugin
  :topleft 100 :split __Routes__
" Make sure Vim doesn't write __Routes__ as a file
  :set buftype=nofile
" Delete everything
  :normal 1GdG
" Put routes output in buffer
  :0r! zeus rake -s routes
" Size window to number of lines (1 plus rake output length)
  :exec ":normal " . line("$") . "_ "
" Move cursor to bottom
  :normal 1GG
" Delete empty trailing line
  :normal dd
endfunction
map <leader>gR :call ShowRoutes()<cr>
map <leader>gv :Files app/views<cr>
map <leader>gc :Files app/controllers<cr>
map <leader>gm :Files app/models<cr>
map <leader>gh :Files app/helpers<cr>
map <leader>gl :Files lib<cr>
map <leader>gp :Files public<cr>
map <leader>ga :Files app<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>
map <leader>gt :Tags<cr>
map <leader>gs :Files spec<cr>
map <leader>ge :Files tests<cr>!pages<space>
map <leader>v :Tags ^<C-r><C-w> '.<C-r>=expand('%:e')<cr><cr>
map <leader>c <C-T>
map <leader>m :GFiles <C-r>=join(argv(), ' ')<cr><cr>
map <leader>b :Buffers<cr>
map <leader>f :GFiles<cr>
map <leader>F :GFiles %%<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! MapCR()
  nnoremap <leader>T :call RunTestFile()<cr>
endfunction
call MapCR()
nnoremap <leader>t :call RunNearestTest()<cr>
nnoremap <leader>a :call RunTests('spec')<cr>

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
    if in_test_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
    let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
    if in_test_file
      let t:spec_line_number = line('.')
    elseif !exists("t:spec_line_number")
        return
    end
    call RunTestFile(":" . t:spec_line_number)
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTests(filename)
    " Write the file and run tests for the given filename
    if expand("%") != ""
      :w
    end

    :execute "T rspec --color " . a:filename
endfunction

function! JumpBack()
  let l:cfile=expand('%')
  let l:nfile=l:cfile
  while l:cfile == l:nfile
    execute 'normal ' . 1 . "\<c-o>"
    let l:nfile=expand('%')
endwhile
endfunction
noremap _ :call JumpBack()<cr>

function! JumpForward()
  let l:cfile=expand('%')
  let l:nfile=l:cfile
  while l:cfile == l:nfile
    execute 'normal ' . 1 . "\<c-i>"
    let l:nfile=expand('%')
  endwhile
endfunction
noremap - :call JumpForward()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ULTISNIPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger = '<c-l>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALIASES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:ca WQ wq
:ca Wq wq
:ca W w
:ca Q q
:ca E e
:ca ag Ack!

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BROWSER RELOAD
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>l :w<cr>:!touch /tmp/touch.js<cr><cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERD TREE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map gnt :NERDTreeToggle<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" easymotion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap s <Plug>(easymotion-overwin-f2)
map <Leader>W <Plug>(easymotion-bd-W)
nmap <Leader>W <Plug>(easymotion-overwin-w)

map <Leader><right> <Plug>(easymotion-lineforward)
map <Leader><down> <Plug>(easymotion-j)
map <Leader><up> <Plug>(easymotion-k)
map <Leader><left> <Plug>(easymotion-linebackward)

noremap <leader><leader> :BTags<cr>

map <leader>/ <Plug>(incsearch-easymotion-/)
map <leader>? <Plug>(incsearch-easymotion-?)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_leader_key = 0

set mouse=c

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MARKS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Jump2()
  echo "Mark : "
  let mark = nr2char(getchar())
  exec "norm! '" . mark . "'\""
endfunc

" map <leader>m :call Jump2()<cr>

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " TMUX
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" function! TmuxRerun()
"  call Send_to_Tmux("!!\n\n")
" endfunction
"
" nnoremap <F2> :call TmuxRerun()<cr>
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ZOOM
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MUSTACHE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:mustache_abbreviations = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUGITIVE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:fugitive_git_executable = 'LANG=en_US.UTF-8 git'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" deoplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_filetype_specific_completion_to_disable = { '*': 1 }
let g:deoplete#enable_at_startup = 1
let b:deoplete_keyword_patterns = '[a-zA-Z_0-9]\k*'

" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SYNTASTIC
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_coffee_checkers = ['coffeelint']
let g:syntastic_javascript_eslint_exec = '/home/dougui/npm/bin/eslint'

let local_eslint = finddir('node_modules', '.;') . '/.bin/eslint'
if matchstr(local_eslint, "^\/\\w") == ''
    let local_eslint = getcwd() . "/" . local_eslint
endif
if executable(local_eslint)
    let g:syntastic_javascript_eslint_exec = local_eslint
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Zeavim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap gzz <Plug>Zeavim
vmap gzz <Plug>ZVVisSelection
" nmap <leader>z <Plug>ZVKeyDocset
nmap gZ <Plug>ZVKeyDocset<CR>
nmap gz <Plug>ZVMotion
let g:zv_file_types = {
           \   'ruby'           : 'ruby,rails',
           \   'javascript'     : 'javascript,ember',
           \   'python'         : 'python 3',
           \   'help'           : 'vim'
           \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ag/Ack
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

nnoremap <leader>s :Ag<space>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Terminal
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

tmap <C-left> <C-w>h
tmap <C-down> <C-w>j
tmap <C-up> <C-w>k
tmap <C-right> <C-w>l
noremap <C-left> <C-w>h
noremap <C-down> <C-w>j
noremap <C-up> <C-w>k
noremap <C-right> <C-w>l
inoremap <C-left> <Esc><C-w>h
inoremap <C-down> <Esc><C-w>j
inoremap <C-up> <Esc><C-w>k
inoremap <C-right> <Esc><C-w>l

tnoremap <C-t> <C-w>:Buffers '/usr/bin \<bar> 'neoterm '<CR>
map <c-t> :Buffers '/usr/bin \<bar> 'neoterm '<CR>

" Quickly create a new terminal in a vertical split
tnoremap <C-q> <C-w>:term ++curwin<CR>
noremap <C-q> :term ++curwin<CR>
inoremap <C-q> <esc>:term ++curwin<CR>

tnoremap <C-a> <C-w>:Tnew<CR>
noremap <C-a> :Tnew<CR>
inoremap <C-a> <esc>:Tnew<CR>

tnoremap <C-g> <C-w>:hide<cr>

autocmd BufLeave !/usr/* setlocal nonumber norelativenumber
autocmd BufEnter !/usr/* setlocal nonumber norelativenumber

tnoremap <C-n> <C-w>:file <C-r>=expand('%')<cr><space>

tnoremap <C-p> <C-w>""
tnoremap <C-w><C-w> <C-w>N

set shell=/usr/bin/zsh

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set rtp+=~/.fzf
let $FZF_DEFAULT_OPTS .= ' --no-height'

let g:fzf_tags_command = 'ctags -Ra -f .git/tags --languages=ruby --exclude=.git --exclude=log'
" let g:tern_map_keys=1

" let g:lsc_auto_map = v:true
" let g:lsc_enable_autocomplete = v:true
" " let g:lsc_server_commands = { 'ruby': 'localhost:7658' }
"
" " let g:lsc_server_commands = { 'javascript': 'localhost:2089' }
" let g:lsc_server_commands = { 'javascript': 'javascript-typescript-stdio -t -l /tmp/javascript-typescript.log' }
" " let g:lsc_server_commands = {
" "      \ 'javascript': 'localhost:2089',
" "      \ 'ruby': {
" "      \    'command': 'localhost:7658',
" "      \    'message_hooks': {
" "      \        'initialize': {
" "      \            'rootUri': {method, params ->
" "      \                          lsc#uri#documentUri('/tmp')},
" "      \        },
" "      \    },
" "      \  },
" "      \}
" "

" set omnifunc=LanguageClient#complete
" set completefunc=LanguageClient#complete
"
" " " let g:lsc_auto_map = {
" " "     \ 'GoToDefinition': '<C-]>',
" " "     \ 'FindReferences': 'gr',
" " "     \ 'NextReference': '<C-n>',
" " "     \ 'PreviousReference': '<C-p>',
" " "     \ 'FindImplementations': 'gI',
" " "     \ 'FindCodeActions': 'ga',
" " "     \ 'DocumentSymbol': 'go',
" " "     \ 'WorkspaceSymbol': 'gS',
" " "     \ 'ShowHover': 'K',
" " "     \ 'Completion': 'completefunc',
" " "     \}
" "
"
" " " let g:lsc_trace_level = 'verbose'
" "
" " set completeopt-=preview

let g:LanguageClient_serverCommands = {
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'ruby': ['tcp://127.0.0.1:7658'],
    \ }

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
