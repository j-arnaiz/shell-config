set nocompatible        " Must be first line
set t_Co=256
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

set background=dark     " Assume a dark background

" Leader key is used on multiple maps
let mapleader = ','

" Importing vundles
source ~/.vimrc.bundles

filetype plugin indent on   " Automatically detect file types.
syntax enable
scriptencoding utf-8

" Color configuration
try
  color molokai
  colorscheme monokai
  let g:molokai_original = 1
  let g:rehash256 = 1
catch /^Vim\%((\a\+)\)\=:E185/
  " deal with it
endtry

" Store a more history (default is 20)
set history=100

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
set backup                               " Backups are nice ...
set undofile                             " So is persistent undo ...
set undolevels=100                       " Maximum number of changes that can be undone

set tabpagemax=10                        " Only show 15 tabs
set showmode                             " Display the current mode
set cursorline                           " Highlight current line
set laststatus=2

" Status line config {
  "set statusline=%<%f\                         " Filename
  "set statusline+=%w%h%m%r                     " Options
  "set statusline+=%{fugitive#statusline()}     " Git Hotness
  "set statusline+=\ [%{&ff}/%Y]                " Filetype
  "set statusline+=\ [%{getcwd()}]              " Current dir
  "set statusline+=%=%-14.(%l,%c%V%)\ %p%%      " Right aligned file nav info
  " set statusline+=%#warningmsg#                " Syntastic status warnings
  " set statusline+=%{SyntasticStatuslineFlag()} " Syntastic status warnings
  "set statusline+=%*
"}

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
set shiftwidth=2                " Use indents of 2 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=2                   " An indentation every 2 columns
set softtabstop=2               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
set matchpairs+=<:>             " Match, to be used with %
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
set clipboard=unnamedplus     " Use system clipboard as default yank/paste
:let loaded_matchparen = 0      " Show closing brackets only when typing the closing bracket

" Fixes problems when writing/edit/exit a file and miss letter by case
command! -bang -nargs=* -complete=file E e<bang> <args>
command! -bang -nargs=* -complete=file W w<bang> <args>
command! -bang -nargs=* -complete=file Wq wq<bang> <args>
command! -bang -nargs=* -complete=file WQ wq<bang> <args>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Q q<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>

" fzf (File fuzzy finder) {
  nnoremap <C-p> :Files<Cr>
" }

" ctrlp {
  "let g:ctrlp_working_path_mode = 'ra'
  "nnoremap <silent> <D-t> :CtrlP<CR>
  "nnoremap <silent> <D-r> :CtrlPMRU<CR>
  "let g:ctrlp_custom_ignore = {
  "      \ 'dir':  '\.git$\|\.hg$\|\.svn$',
  "      \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }
  "let g:ctrlp_user_command = {
  "      \ 'types': {
  "      \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
  "      \ 2: ['.hg', 'hg --cwd %s locate -I .'],
  "      \ },
  "      \ 'fallback': 'find %s -type f'
  "      \ }
"}

" Syntastic {
  " let g:syntastic_aggregate_errors = 1
  " let g:syntastic_check_on_open = 1
  " let g:syntastic_check_on_wq = 0
  " let g:syntastic_gitcommit_checkers = ['language_check']
  " let g:syntastic_svn_checkers = ['language_check']
  " let g:syntastic_yaml_checkers = ['pyyaml']
  " let g:syntastic_javascript_checkers = ['eslint']
  " let g:syntastic_javascript_eslint_exec = '/home/jesus/Workspace/samyroad/admin-web/node_modules/.bin/eslint'
  " " let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
  " " let g:syntastic_php_phpcs_exec = '/route/to/phpcs'
  " " let g:syntastic_php_phpcs_args = '--standard=/route/to/coding-standard --report=csv'
  " " let g:syntastic_php_phpmd_exec = '/route/to/phpmd'
  " " let g:syntastic_php_phpmd_post_args = '/route/to/.phpmd.xml'
  " let g:syntastic_error_symbol = "✗"
  " let g:syntastic_warning_symbol = "⚠"
  " let g:syntastic_ruby_checkers = ['mri', 'rubocop']
" }

" CoC (Syntax and Language server) {
  " Use tab for trigger completion with characters ahead and navigate.
  " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
  " other plugin before putting this into your config.
  " inoremap <silent><expr> <TAB>
  "       \ pumvisible() ? "\<C-n>" :
  "       \ <SID>check_back_space() ? "\<TAB>" :
  "       \ coc#refresh()
  " inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
  else
    inoremap <silent><expr> <c-@> coc#refresh()
  endif

  " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
  " position. Coc only does snippet and additional edit on confirm.
  " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
  if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
  else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  endif

  " Use `[g` and `]g` to navigate diagnostics
  " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " GoTo code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use K to show documentation in preview window.
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Symbol renaming.
  nmap <leader>rn <Plug>(coc-rename)

  " Formatting selected code.
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Applying codeAction to the selected region.
  " Example: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap keys for applying codeAction to the current buffer.
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Apply AutoFix to problem on the current line.
  nmap <leader>qf  <Plug>(coc-fix-current)

  " Map function and class text objects
  " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
  xmap if <Plug>(coc-funcobj-i)
  omap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap af <Plug>(coc-funcobj-a)
  xmap ic <Plug>(coc-classobj-i)
  omap ic <Plug>(coc-classobj-i)
  xmap ac <Plug>(coc-classobj-a)
  omap ac <Plug>(coc-classobj-a)

  " Use CTRL-S for selections ranges.
  " Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
  nmap <silent> <C-s> <Plug>(coc-range-select)
  xmap <silent> <C-s> <Plug>(coc-range-select)

  " Add `:Format` command to format current buffer.
  command! -nargs=0 Format :call CocAction('format')

  " Add `:Fold` command to fold current buffer.
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

  " Add (Neo)Vim's native statusline support.
  " NOTE: Please see `:h coc-status` for integrations with external plugins that
  " provide custom statusline: lightline.vim, vim-airline.
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

  " Mappings for CoCList
  " Show all diagnostics.
  nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
  " Manage extensions.
  nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
  " Show commands.
  nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
  " Find symbol of current document.
  nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
  " Search workspace symbols.
  nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
  " Resume latest coc list.
  nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" }

" Fugitive {
  nnoremap <silent> <leader>gs :Git<CR>
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

" UndoTree {
  nnoremap <Leader>u :UndotreeToggle<CR>
  let g:undotree_SetFocusWhenToggle=1
"}

" Airline {
  " let g:airline_theme = 'molokai' " 'powerlineish' is another choice
  " let g:airline_powerline_fonts=1
  " let g:airline#extensions#tabline#enabled = 1
" }

" YouCompleteMe {
  " let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
  " let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" }

" UltiSnips {
  " let g:UltiSnipsExpandTrigger = "<tab>"
  " let g:UltiSnipsJumpForwardTrigger = "<tab>"
  " let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" }

" Super tab {
  " let g:SuperTabDefaultCompletionType = '<C-n>'
" }

" EasyClip {
  " To set a mark use gm instead of m
  nnoremap gm m
  " m will be used for move
  let g:EasyClipUseSubstituteDefaults = 1
  let g:EasyClipUseCutDefaults = 1
  let g:EasyClipUsePasteToggleDefaults = 0
  nmap M <Plug>MoveMotionEndOfLinePlug

  nmap <Leader>n <plug>EasyClipSwapPasteForward
  nmap <Leader>p <plug>EasyClipSwapPasteBackwards
" }

" NerdTree {
  :map! <F4> <C-c>:NERDTreeToggle<CR>:NERDTreeMirror<CR>
  :map <F4> <C-c>:NERDTreeToggle<CR>:NERDTreeMirror<CR>
  nmap <leader>tf :NERDTreeFind<CR>

  let NERDTreeShowBookmarks=1
  let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git$', '\.hg', '\.svn', '\.bzr']
  let NERDTreeQuitOnOpen=1
  let NERDTreeKeepTreeInNewTab=1
  let g:nerdtree_tabs_open_on_gui_startup=0
" }

let g:rainbow_active=1

" Ack {
  if executable('ag')
    let g:ackprg = 'ag --vimgrep'
  endif
" }

" LaTex {
   " let g:tex_nine_config = {
   "  \'compiler': 'pdflatex',
   "  \'leader': ','
   "  \}
" }" 

" JSX {
   " let g:jsx_ext_required = 0
" }

" Indent Guides {
  let indent_guides_auto_colors = 0
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=darkgrey ctermbg=233
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=232
  let g:indent_guides_enable_on_vim_startup = 1
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

" Transform windows files into unix files {
  function! Dos2unix()
    :%s///g
  endfunction
" }

" Misc mapping {
  " Home and End keys fix
  map OH <Home>
  map OF <End>
  imap OH <Home>
  imap OF <End>
  " Yank all line to the end
  nnoremap Y y$
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
  map <F7> gg=G<CR>

  " Show open buffers
  :nnoremap <F5> :buffers<CR>:buffer<Space>

  " Remove white spaces
  nmap <Leader>w :call StripTrailingWhitespace()<CR>

  " Moving between windows without using Ctrl
  nmap <Space>l <C-w>l
  nmap <Space>h <C-w>h
  nmap <Space>j <C-w>j
  nmap <Space>k <C-w>k

  "open buffer previous
  nmap <Leader>bp :bp<CR>

  "open buffer next
  nmap <Leader>bn :bn<CR>

  " Ctrl-E move to end of line in insert mode
  imap <C-e> A
  " <Leader>l move to end of line
  noremap <Leader>l $
  " <Leader>h move to first non blank char of line
  noremap <Leader>h ^

  " Jump to tag
  map <Leader>t 
  map <Leader>T <C-W>}

  " Close buffer
  nmap <Leader>bc :w<CR>:bd<CR>

  " Transform json to readable json
  nmap <Leader>j :%!python3 -m json.tool<CR>

  " Open ansible vault
  nmap <Leader>v :!ansible-vault edit %<CR>

  " Octave mappings (octave is for math operations)
  " nmap ,o :.!octave --silent 2> /dev/null \| head -n1 \| cut -c8-<CR>
  " vmap ,o :!octave --silent 2> /dev/null \| head -n1 \| cut -c8-<CR>

  " Search for selected text, forwards or backwards.
  vnoremap // y/<C-R>"<CR>

  " Convert windows files into unix files
  nmap <Leader>d :call Dos2unix()<CR>

  " User jk to esc from insert mode
  imap jk <Esc>
"}
