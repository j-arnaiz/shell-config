set nocompatible        " Must be first line
set t_Co=256
if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif


set background=dark     " Assume a dark background

let mapleader = ','
source ~/.vimrc.bundles

" Color configuration
filetype plugin indent on   " Automatically detect file types.
syntax enable
scriptencoding utf-8
set background=dark

try
    color molokai
catch /^Vim\%((\a\+)\)\=:E185/
    " deal with it
endtry

" Store a more history (default is 20)
set history=100

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
set backup                  " Backups are nice ...
set undofile                " So is persistent undo ...
set undolevels=100         " Maximum number of changes that can be undone

set tabpagemax=10               " Only show 15 tabs
set showmode                    " Display the current mode
set cursorline                  " Highlight current line
set laststatus=2

set statusline=%<%f\                     " Filename
set statusline+=%w%h%m%r                 " Options
set statusline+=%{fugitive#statusline()} " Git Hotness
set statusline+=\ [%{&ff}/%Y]            " Filetype
set statusline+=\ [%{getcwd()}]          " Current dir
set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set nu                          " Line numbers on
set relativenumber              " Relative number lines
set showmatch                   " Show matching brackets/parenthesis
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set nowrap                      " Do not wrap long lines
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
set matchpairs+=<:>             " Match, to be used with %
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
:let loaded_matchparen = 0

"autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
autocmd BufNewFile,BufRead *.handlebars set filetype=html.twig
command! -bang -nargs=* -complete=file E e<bang> <args>
command! -bang -nargs=* -complete=file W w<bang> <args>
command! -bang -nargs=* -complete=file Wq wq<bang> <args>
command! -bang -nargs=* -complete=file WQ wq<bang> <args>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Q q<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>



" NerdTree {
    "map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
    :map! <F4> <C-c>:NERDTreeToggle<CR>:NERDTreeMirror<CR>
    :map <F4> <C-c>:NERDTreeToggle<CR>:NERDTreeMirror<CR>
    "map <leader>e :NERDTreeFind<CR>
    nmap <leader>nt :NERDTreeFind<CR>

    let NERDTreeShowBookmarks=1
    let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git$', '\.hg', '\.svn', '\.bzr']
    let NERDTreeQuitOnOpen=1
    let NERDTreeKeepTreeInNewTab=1
    let g:nerdtree_tabs_open_on_gui_startup=0
" }

" Syntastic {
    "let g:syntastic_always_populate_loc_list = 1
    "let g:syntastic_auto_loc_list = 1
    let g:syntastic_aggregate_errors = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_gitcommit_checkers = ['language_check']
    let g:syntastic_svn_checkers = ['language_check']
    let g:syntastic_yaml_checkers = ['pyyaml']
    let g:syntastic_javascript_checkers = ['eslint']
    let g:syntastic_javascript_eslint_exec = '/home/jesus/Workspace/samyroad/admin-web/node_modules/.bin/eslint'
    let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
    let g:syntastic_php_phpcs_exec = "/home/jesus/.composer/vendor/bin/phpcs"
    let g:syntastic_php_phpcs_args = "--standard=/home/jesus/.composer/vendor/m6web/symfony2-coding-standard/Symfony2 --report=csv"
    let g:syntastic_php_phpmd_exec = "/home/jesus/.composer/vendor/bin/phpmd"
    let g:syntastic_php_phpmd_post_args = "~/.phpmd.xml"
    let g:syntastic_error_symbol = "✗"
    let g:syntastic_warning_symbol = "⚠"
    let g:syntastic_ruby_checkers = ['mri', 'rubocop']
" }

" Tabularize {
    nmap <Leader>a& :Tabularize /&<CR>
    vmap <Leader>a& :Tabularize /&<CR>
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>aa :Tabularize /=><CR>
    vmap <Leader>aa :Tabularize /=><CR>
    nmap <Leader>a: :Tabularize /:<CR>
    vmap <Leader>a: :Tabularize /:<CR>
    nmap <Leader>a:: :Tabularize /:\zs<CR>
    vmap <Leader>a:: :Tabularize /:\zs<CR>
    nmap <Leader>a, :Tabularize /,<CR>
    vmap <Leader>a, :Tabularize /,<CR>
    nmap <Leader>a,, :Tabularize /,\zs<CR>
    vmap <Leader>a,, :Tabularize /,\zs<CR>
    nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
    vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
    nmap <Leader>ad :Tabularize /[$@]\+[A-Za-z_0-9]*<CR>
    vmap <Leader>ad :Tabularize /[$@]\+[A-Za-z_0-9]*<CR>
" }



" ctrlp {
    let g:ctrlp_working_path_mode = 'ra'
    nnoremap <silent> <D-t> :CtrlP<CR>
    nnoremap <silent> <D-r> :CtrlPMRU<CR>
    let g:ctrlp_custom_ignore = {
                \ 'dir':  '\.git$\|\.hg$\|\.svn$',
                \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

    let g:ctrlp_user_command = {
                \ 'types': {
                \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
                \ 2: ['.hg', 'hg --cwd %s locate -I .'],
                \ },
                \ 'fallback': 'find %s -type f'
                \ }
"}

" Fugitive {
    nnoremap <silent> <leader>gs :Gstatus<CR>
    nnoremap <silent> <leader>gd :Gdiff<CR>
    nnoremap <silent> <leader>gc :Gcommit<CR>
    nnoremap <silent> <leader>gb :Gblame<CR>
    nnoremap <silent> <leader>gl :Glog<CR>
    nnoremap <silent> <leader>gp :Git push<CR>
    nnoremap <silent> <leader>gr :Gread<CR>
    nnoremap <silent> <leader>gw :Gwrite<CR>
    nnoremap <silent> <leader>ge :Gedit<CR>
    nnoremap <silent> <leader>gg :SignifyToggle<CR>
"}

" Neocomplete {
    let g:acp_enableAtStartup = 0
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_smart_case = 1
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
    let g:neocomplete#disable_auto_complete = 1
    let g:neocomplete#enable_auto_select = 1
    "inoremap <expr><C-g>     neocomplete#undo_completion()
    "inoremap <expr><C-l>     neocomplete#complete_common_string()
    "inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    "function! s:my_cr_function()
    "  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
    "endfunction
    "noremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    "inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    "inoremap <expr><C-y>  neocomplete#close_popup()
    "inoremap <expr><C-e>  neocomplete#cancel_popup()
    inoremap <expr><C-l>     neocomplete#start_manual_complete()
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" }



" Neosnippet {
    let g:neosnippet#enable_snipmate_compatibility = 1
    " Tell Neosnippet about the other snippets
    let g:neosnippet#snippets_directory='~/.vim/bundle/snippets/snippets'
    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    smap <C-k>     <Plug>(neosnippet_expand_or_jump)
    xmap <C-k>     <Plug>(neosnippet_expand_target)
    imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)"
    \: pumvisible() ? "\<C-n>" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)"
    \: "\<TAB>"

    autocmd BufNewFile,BufRead *.html.erb set filetype=html.eruby

    " For snippet_complete marker.
    if has('conceal')
      set conceallevel=0 concealcursor=i
    endif
    set conceallevel=0
"}

" PDV (php doc) {
    let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates"
    nnoremap <Leader>c :call pdv#DocumentCurrentLine()<CR>
"}

" UndoTree {
    nnoremap <Leader>u :UndotreeToggle<CR>
    let g:undotree_SetFocusWhenToggle=1
"}


" Airline {
    let g:airline_theme = 'molokai' " 'powerlineish' is another choice
    let g:airline_powerline_fonts=1
    let g:airline#extensions#tabline#enabled = 1
    "let g:airline_left_sep='›'  " Slightly fancier than '>'
    "let g:airline_right_sep='‹' " Slightly fancier than '<'
"}

" Misc mapping {

    " Copy paste to reg
    nmap <Leader>dd "+dd
    nmap <Leader>p "+p
    vmap <Leader>p "+p
    nmap <Leader>P "+P
    vmap <Leader>d "+d
    vmap <Leader>y "+y
    nmap <Leader>yy "+yy

    " Home and End keys fix
    map OH <Home>
    map OF <End>
    imap OH <Home>
    imap OF <End>
    " Yank all line to the end
    nnoremap Y y$
    " To disable highlight
    nmap <silent> <leader>/ :nohlsearch<CR>
    " Find merge conflict markers
    map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>
    " Visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv

    " When you forget to edit with sudo vim
    cmap w!! w !sudo tee % >/dev/null

    " Easier horizontal scrolling
    map <Leader>= <C-w>=

    " Map <Leader>ff to display all lines with keyword under cursor
    " and ask which one to jump to
    nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

    " Easier horizontal scrool
    map zl zL
    map zh zH

    " Auto indent all file
    map <F7> mzgg=G`z<CR>

    " Show open buffers
    :nnoremap <F5> :buffers<CR>:buffer<Space>

    " Remove white spaces
    nmap <Leader>w :call StripTrailingWhitespace()<CR>

    nmap <Space>l <C-w>l
    nmap <Space>h <C-w>h
    nmap <Space>j <C-w>j
    nmap <Space>k <C-w>k


    "open buffer previous
    nmap <Leader>bh :bp<CR>

    "open buffer next
    nmap <Leader>bl :bn<CR>

    imap <C-e> A
    nmap L $
    vmap L $

    map <Leader>t 
    map <Leader>T <C-W>}

    nmap <Leader>bc :w<CR>:bd<CR>

    nmap <Leader>j :%!python -m json.tool<CR>
"}

" TagbarToggle {
    map <F2> :TagbarToggle<CR>
" }


" ctags {
    set tags=.php.tags,~/.vimtags

    "au BufWritePost *.php,*.js silent !ctags-exuberant -f .git/php.tags --languages=PHP,javascript --exclude=.git -R 2> /dev/null &
"}

" LaTex {
   let g:tex_nine_config = {
    \'compiler': 'pdflatex',
    \'leader': ','
    \}
" }

" JSX {
   let g:jsx_ext_required = 0
" }

" Init directories {
    function! InitializeDirectories()
        let parent = $HOME
        let prefix = 'vim'
        let dir_list = {
                    \ 'backup': 'backupdir',
                    \ 'views': 'viewdir',
                    \ 'swap': 'directory',
                    \ 'undo': 'undodir' }

        let common_dir = parent . '/.' . prefix

        for [dirname, settingname] in items(dir_list)
            let directory = common_dir . dirname . '/'
            if exists("*mkdir")
                if !isdirectory(directory)
                    call mkdir(directory)
                endif
            endif
            if !isdirectory(directory)
                echo "Warning: Unable to create backup directory: " . directory
                echo "Try: mkdir -p " . directory
            else
                let directory = substitute(directory, " ", "\\\\ ", "g")
                exec "set " . settingname . "=" . directory
            endif
        endfor
    endfunction
    call InitializeDirectories()
"}

" Strip whitespace {
    function! StripTrailingWhitespace()
        " Preparation: save last search, and cursor position.
        let _s=@/
        let l = line(".")
        let c = col(".")
        " do the business:
        %s/\s\+$//e
        " clean up: restore previous search history, and cursor position
        let @/=_s
        call cursor(l, c)
    endfunction
"}
    autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig

    function! Dos2unix()
        :%s///g
    endfunction

    nmap <Leader>d :call Dos2unix()<CR>

    vnoremap // y/<C-R>"<CR>
    " Search for selected text, forwards or backwards.

    nmap ,o :.!octave --silent \| cut -c8-<CR>
    vmap ,o :!octave --silent \| cut -c8-<CR>

    nmap <leader>md :silent !cat % \| markdown > `pwd \| awk -F/ '{print $(NF)}'`%.html<cr><C-l>
