" Modeline and Notes {
" vim: set sw=4 ts=4 sts=4 et tw=80 foldmarker={,} foldlevel=0 foldmethod=marker:
"
<<<<<<< HEAD
" Organizing my .vimrc files
" I'm borrowing everything from [here](https://github.com/spf13/spf13-vim) and
" am super thankful that Steve Francia has that super helpful guide to his own
" `.vimrc` but also that [he made this](http://vim.spf13.com) for anyone that
" wants to use his standards out-of-the-box without much configurations.
"
" This is still very much a work-in-progress, but I'm finally at a point where
" my original `.vimrc` was making me feel disorganized.
"
=======
" }

" Load Bundle config {
    if filereadable( expand( "~/.config/nvim/bundles.vim" ) )
        source ~/.config/nvim/bundles.vim
    endif
>>>>>>> 4316c48 (Add in nvim files;)
" }

" Basics {
    let mapleader = ","
    set magic
<<<<<<< HEAD
    set shell=/usr/local/bin/zsh
    set modeline
    set modelines=5
    set cmdheight=2
    set updatetime=100
    set cursorline
=======
    set shell=/usr/bin/zsh
    set modeline
    set modelines=5
    set updatetime=100
    set guicursor=
    if &term =~ "xterm\\|rxvt"
      " use an orange cursor in insert mode
      let &t_SI = "\<Esc>]12;orange\x7"
      " use a red cursor otherwise
      let &t_EI = "\<Esc>]12;red\x7"
      silent !echo -ne "\033]12;red\007"
      " reset cursor when vim exits
      autocmd VimLeave * silent !echo -ne "\033]112\007"
      " use \003]12;gray\007 for gnome-terminal
    endif
>>>>>>> 4316c48 (Add in nvim files;)
    set hidden
    set noerrorbells
    set novisualbell
    set t_vb=
    set number
    set ruler
    set shiftwidth=2
    set tabstop=2
    set expandtab
    set colorcolumn=50,72,80,100
    set backspace=eol,start,indent
    set whichwrap+=<,>,h,l
    set ignorecase
    set smartcase
    set hlsearch
    set incsearch
    set lazyredraw
    set showmatch
    set mat=2
    set tm=500
    set ffs=unix,dos,mac
    set encoding=utf8
    set nobackup
    set nowb
    set noswapfile
    set listchars=eol:¬,tab:›·,trail:·,extends:›,precedes:‹
    set list
<<<<<<< HEAD
    set completeopt=menuone
=======
    "set completeopt=menuone
>>>>>>> 4316c48 (Add in nvim files;)
    set lbr
    set ai
    set si
    set nowrap
    set laststatus=2
" }

<<<<<<< HEAD
" Load Bundle config {
    if filereadable(expand("~/.config/nvim/bundles.vim"))
        source ~/.config/nvim/bundles.vim
    endif
" }

=======
>>>>>>> 4316c48 (Add in nvim files;)
" Worflow {
    map 0 ^
    map <f8> :TagbarToggle<cr>
    " Shortcut for disabling highlighting
    nnoremap <silent> <C-l> :nohl<CR><C-l>
    " Shortcut for enabling and disabling paste mode
    map <leader>pp :setlocal paste!<cr>
    " Shortcut for enabling spelling
    map <leader>ss :setlocal spell!<cr>
<<<<<<< HEAD
    " Allow for macosx and tmux and vim clipboard sharing.
    " Following this blog post: http://evertpot.com/osx-tmux-vim-copy-paste-clipboard/
    set clipboard=unnamed
=======
    set clipboard=unnamedplus
>>>>>>> 4316c48 (Add in nvim files;)
    " Split 'correctly' for left-to-right readers. {
        set splitbelow
        set splitright
    " }
    set history=700
    " For when you forget to sudo.. Really Write the file. {
        cmap w!! w !sudo tee % >/dev/null
    " }
    map <leader>ll :set list!<cr>
    map <space> /
    if has("mac") || has("macunix")
        nmap <D-j> <M-j>
        nmap <D-k> <M-k>
        vmap <D-j> <M-j>
        vmap <D-k> <M-k>
    endif
    " Moving up and down faster than one row at a damn time. {
        nnoremap <C-e> 3<C-e>
        nnoremap <C-y> 3<C-y>
    " }
    " Delete trailing whitespace {
        func! DeleteTrailingWS()
            exe "normal mz"
            %s/\s\+$//ge
            exe "normal `z"
        endfunc
        autocmd BufWrite * :call DeleteTrailingWS()
    " }
    " GUI Options {
        if has( 'gui_running' )
            set guifont=M\+\ 2m\ NerdFont\ Patched:h16
            autocmd! GUIEnter * set vb t_vb=
        endif
    " }
    augroup vimrc_todo
        au!
        au Syntax * syn match CustomTodos /\v<(FIXME|NOTE|TODO|OPTIMIZE|XXX):/
              \ containedin=.*Comment,vimCommentTitle
    augroup END
    hi def link CustomTodos Todo
" }

" Theme {
    syntax enable
    set t_Co=256
<<<<<<< HEAD
    " light {
    if $ITERM_PROFILE == 'tomorrow'
        set background=light
        colorscheme tomorrow
        let g:airline_theme = 'tomorrow'
    endif
    " }
    " dark {
    if $ITERM_PROFILE == 'hopscotch'
        set background=dark
        colorscheme base16-hopscotch
        let g:airline_theme = 'kolor'
    endif
    " }
" }

" CoC {
    "let g:ale_sign_error = "\uF470"
    "let g:ale_sign_warning = "\uF0E7"
    "let g:airline#extensions#ale#enabled = 1

    " use <tab> for trigger completion and navigate to the next complete item
    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~ '\s'
    endfunction

    inoremap <silent><expr> <Tab>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<Tab>" :
          \ coc#refresh()

    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

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
      elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
      else
        execute '!' . &keywordprg . " " . expand('<cword>')
      endif
    endfunction
=======
    "set background=light
    "colorscheme PaperColor
    "let g:airline_theme = 'papercolor'
    set background=dark
    colorscheme dracula
    let g:airline_theme = 'dracula'
" }

" Ale {
    let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
    let g:ale_sign_error = "\uF470"
    let g:ale_sign_warning = "\uF0E7"
    let g:airline#extensions#ale#enabled = 1
>>>>>>> 4316c48 (Add in nvim files;)
" }

" SnipMate {
    imap <C-J> <Plug>snipMateBack
    smap <C-J> <Plug>snipMateBack
    imap <C-K> <Plug>snipMateNextOrTrigger
    smap <C-K> <Plug>snipMateNextOrTrigger
    let g:snipMate = { 'snippet_version' : 1 }
" }

" Syntax Folding {
    set foldmethod=syntax
<<<<<<< HEAD
    set foldlevelstart=2
=======
    set foldlevelstart=4
>>>>>>> 4316c48 (Add in nvim files;)
    let php_folding = 1
    let javascript_folding = 1
    let ruby_fold = 1
    let sh_fold_enabled = 1
    let xml_syntax_folding  = 1
    let html_fold_enabled = 1
" }

" TagBar configurations {
    let g:concourse_flytags_bin = "flytags"
    let g:tagbar_type_concourse = {
        \ 'ctagstype' : 'concourse',
        \ 'kinds'     : [
            \ 'p:primitives',
            \ 't:resource_types',
            \ 'g:groups',
            \ 'r:resources',
            \ 'i:inputs',
            \ 'k:tasks',
            \ 'o:outputs',
            \ 'j:jobs',
        \ ],
        \ 'sro' : '.',
        \ 'kind2scope' : {
            \ 'p' : 'ptype',
            \ 'j' : 'stype'
        \ },
        \ 'scope2kind' : {
            \ 'ptype' : 'p',
            \ 'stype' : 'j'
        \ },
<<<<<<< HEAD
        \ 'ctagsbin'  : expand("/Users/rogerruiz/Developer/golang/bin/flytags"),
=======
        \ 'ctagsbin'  : expand("/usr/local/go/bin/flytags"),
>>>>>>> 4316c48 (Add in nvim files;)
        \ 'ctagsargs' : '-sort -silent'
    \ }
    " Add support for markdown files in tagbar.
    let g:tagbar_type_markdown = {
        \ 'ctagstype': 'markdown',
<<<<<<< HEAD
        \ 'ctagsbin' : '/usr/local/bin/markdown2ctags.py',
=======
        \ 'ctagsbin' : '/home/rsr/.local/share/nvim/plugged/markdown2ctags/markdown2ctags.py',
>>>>>>> 4316c48 (Add in nvim files;)
        \ 'ctagsargs' : '-f - --sort=yes',
        \ 'kinds' : [
            \ 's:sections',
            \ 'i:images'
        \ ],
        \ 'sro' : '|',
        \ 'kind2scope' : {
            \ 's' : 'section',
        \ },
        \ 'sort': 0,
    \ }
    let g:tagbar_type_rust = {
        \ 'ctagstype' : 'rust',
        \ 'kinds' : [
            \'T:types,type definitions',
            \'f:functions,function definitions',
            \'g:enum,enumeration names',
            \'s:structure names',
            \'m:modules,module names',
            \'c:consts,static constants',
            \'t:traits,traits',
            \'i:impls,trait implementations',
        \]
    \}
    let g:tagbar_type_go = {
        \ 'ctagstype' : 'go',
        \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
        \ ],
        \ 'sro' : '.',
        \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
        \ },
        \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
        \ },
        \ 'ctagsbin'  : 'gotags',
        \ 'ctagsargs' : '-sort -silent'
    \ }
    " EasyTags configurations {
<<<<<<< HEAD
        let g:easytags_cmd = '/usr/local/bin/ctags'
=======
        let g:easytags_cmd = '/usr/bin/ctags'
>>>>>>> 4316c48 (Add in nvim files;)
        let g:easytags_async = 1
    " }

" }

" Golang Preferences {

    "use K as 5k, not GoDoc
    let g:go_doc_keywordprg_enabled = 0

    " format with goimports instead of gofmt
    let g:go_fmt_command = "goimports"
    nnoremap <leader>glf :GoFmt<CR>
    inoremap <leader>glf <ESC>:GoFmt<CR>
    vnoremap <leader>glf <ESC>:GoFmt<CR>
    nnoremap <leader>glv :GoVet<CR>
    inoremap <leader>glv <ESC>:GoVet<CR>
    vnoremap <leader>glv <ESC>:GoVet<CR>
<<<<<<< HEAD
=======
    nnoremap <leader>gld :GoDef<CR>
    inoremap <leader>gld <ESC>:GoDef<CR>
    vnoremap <leader>gld <ESC>:GoDef<CR>
>>>>>>> 4316c48 (Add in nvim files;)
    nnoremap <leader>gli :GoInfo<CR>
    inoremap <leader>gli <ESC>:GoInfo<CR>
    vnoremap <leader>gli <ESC>:GoInfo<CR>
    nnoremap <leader>glb :GoBuild<CR>
    inoremap <leader>glb <ESC>:GoBuild<CR>
    vnoremap <leader>glb <ESC>:GoBuild<CR>
    nnoremap <leader>glr :GoRun<CR>
    inoremap <leader>glr <ESC>:GoRun<CR>
    vnoremap <leader>glr <ESC>:GoRun<CR>
    nnoremap <leader>gll :GoLint<CR>
    inoremap <leader>gll <ESC>:GoLint<CR>
    vnoremap <leader>gll <ESC>:GoLint<CR>
<<<<<<< HEAD
    nnoremap <leader>gld :GoDef<CR>
    inoremap <leader>gld <ESC>:GoDef<CR>
    vnoremap <leader>gld <ESC>:GoDef<CR>

    let g:go_list_type = "quickfix"
    func! RunGoFmt()
        exe "GoFmt"
    endfunc
    autocmd BufWrite *.go :call RunGoFmt()

    autocmd FileType go let b:vcm_tab_complete = "omni"

=======
    nnoremap <leader>glt :GoTest<CR>
    inoremap <leader>glt <ESC>:GoTest<CR>
    vnoremap <leader>glt <ESC>:GoTest<CR>

    autocmd FileType go let b:vcm_tab_complete = "omni"

    let g:go_list_type = "quickfix"
    let g:go_fmt_autosave = 1
    let g:go_info_mode = 'gopls'
    let g:go_auto_type_info = 1

    let g:go_metalinter_command = "golangci-lint"

" }

" Deoplete {
    let g:deoplete#enable_at_startup = 1
" }

" IndentLine Preferences {
    let g:indentLine_char_list = ['|', '¦', '┆', '┊']
>>>>>>> 4316c48 (Add in nvim files;)
" }

" Airline Preferences {
    let g:airline_powerline_fonts = 0
    let g:airline#extensions#whitespace#mixed_indent_algo = 1
    let g:airline#extensions#whitespace#enabled = 1
    let g:airline#extensions#syntastic#enabled = 1
    let g:airline#extensions#tmuxline#enabled = 1
<<<<<<< HEAD

    if ! exists( 'g:airline_symbols' )
        let g:airline_symbols = {}
        let g:airline_left_sep = "\uF44A "
        let g:airline_right_sep = " \uF438 "
=======
    if ! exists( 'g:airline_symbols' )
        let g:airline_symbols = {}
        let g:airline_left_sep = "\uF44A "
        let g:airline_right_sep = "\uF438 "
>>>>>>> 4316c48 (Add in nvim files;)
        let g:airline_symbols.space = "\uA0 "
        let g:airline_symbols.crypt = "\uF023 "
        let g:airline_symbols.linenr = "\uF1DD "
        let g:airline_symbols.branch = "\uE702 "
        let g:airline_symbols.paste = "\uF0D0 "
        let g:airline_symbols.whitespace = "\uF1FC "
        let g:airline_symbols.notexists = " \uF440"
    endif
" }

" Control-P {
    let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.?(git|hg|svn|node_modules|exports|bower_components|opencontrols|vendor|target|public|_site|rollup-cache.*|broccoli_.*|creator-.*|core_.*|funnel-.*|simple_.*|stub_generator.*)$',
    \ 'file': '\v\.(exe|so|dll|metadata_never_index)$'
    \ }
" }

" Tmuxline Preferences {
    let g:tmuxline_preset = {
<<<<<<< HEAD
      \'a'    : [ '#(echo "\uf02b ") #S #(echo "\uf277 ") #I.#P', '#(/usr/local/bin/outatime)' ],
      \'b'    : [ '#(/usr/local/bin/current_itunes_song)' ],
      \'win'  : [ '#I #W #(echo "\uf248  ")' ],
      \'cwin' : [ '#I #W #(if [[ "#F" == "*" ]]; then echo "\uf247  "; elif [[ "#F" == "*Z" ]]; then echo "\uf0b2 "; elif [[ "#F" == "*M" ]]; then echo "\uf435:"; fi)' ],
      \'x'    : [ '#(/usr/local/bin/battery -tp) ' ],
      \'z'    : ['#(echo "\uf017 ") %l:%M%p', '#(echo "\uf073 ") %a %m/%d'] }
=======
      \'a'    : [ '#(echo "\uf02b ") #S #(echo "\uf277 ") #I.#P' ],
      \'b'    : [ '#(/usr/local/bin/outatime) #(/usr/local/bin/spotify-airline)' ],
      \'win'  : [ '#I #W #(echo "\uf248")' ],
      \'cwin' : [ '#I #W #(if [[ "#F" == "*" ]]; then echo "\uf247  "; elif [[ "#F" == "*Z" ]]; then echo "\uf0b2 "; elif [[ "#F" == "*M" ]]; then echo "\uf435:"; fi)' ],
      \'x'    : [ '#(/usr/local/bin/get-both-batteries) ' ],
      \'z'    : ['#(echo "\uf017 ") %H:%M:%S', '#(echo "\uf073 ") %a %m/%d'] }
>>>>>>> 4316c48 (Add in nvim files;)
    let g:tmuxline_separators = {
          \ 'left' : "\uF44A",
          \ "left_alt": "\uF0DA",
          \ "right" : "\uF438",
          \ "right_alt" : "\uF0D9",
          \ "space" : "\uA0" }
" }

<<<<<<< HEAD
=======
" Terraform {
    let g:terraform_align=1
    let g:terraform_fmt_on_save=1

    let g:deoplete#omni_patterns = {}
    let g:deoplete#omni_patterns.terraform = '[^ *\t"{=$]\w*'
    let g:deoplete#enable_at_startup = 1
    call deoplete#initialize()
" }

>>>>>>> 4316c48 (Add in nvim files;)
" Markdown {
    let g:vim_markdown_folding_disabled = 0

    nnoremap <leader>mdp :PrevimOpen<CR>
    inoremap <leader>mdp <ESC>:PrevimOpen<CR>
    vnoremap <leader>mdp <ESC>:PrevimOpen<CR>

" }

" NERDTree {
    silent! nmap <C-k> :NERDTreeToggle<CR>
    silent! map <C-j> :NERDTreeFind<CR>
    let g:NERDTreeShowHidden = 1
    if exists("g:loaded_webdevicons")
      call webdevicons#refresh()
    endif
"}

" NERDCommenter {
    let g:NERDCustomDelimiters = { 'scss': { 'left': '// ', 'leftAlt': '/*', 'rightAlt': '*/' }, 'javascript': { 'left': '// ', 'leftAlt': '/**', 'rightAlt': '*/' } }
    let g:NERDCommentEmptyLines = 1
    let g:NERDTrimTrailingWhitespace = 1
" }

" editorconfig {
    let g:EditorConfig_exec_path = '/usr/local/bin/editorconfig'
    let g:EditorConfig_exclude_patterns = [ 'fugitive://.*', 'scp://.*' ]
" }

<<<<<<< HEAD
" IndentLine {
    let g:indentLine_color_tty_light = 2
    let g:indentLine_color_dark = 1
    let g:indentLine_char = '|'
" }

" Conceal Cursor {
    let g:vim_markdown_conceal = 0
    let g:vim_json_syntax_conceal = 0
    let g:indentLine_noConcealCursor = 1
" }

" GitGutter {
    if isdirectory( expand( "~/.vim/bundle/vim-gitgutter" ) )
        let g:gitgutter_sign_added = "\uF458"
        let g:gitgutter_sign_modified = "\uF45A"
        let g:gitgutter_sign_removed = "\uF459"
        let g:gitgutter_sign_modified_removed = "\uF45B"
    endif
" }

" Fugitive {
    if isdirectory( expand( "~/.vim/bundle/vim-fugitive/" ) )
        nnoremap <silent> <leader>gs :Gstatus<CR>
        nnoremap <silent> <leader>gd :Git diff<CR>
        nnoremap <silent> <leader>gc :Git commit -v<CR>
        nnoremap <silent> <leader>gb :Git blame<CR>
        nnoremap <silent> <leader>gl :Git log<CR>
        nnoremap <silent> <leader>gp :Git push<CR>
        nnoremap <silent> <leader>gr :Git read<CR>
        nnoremap <silent> <leader>gw :Git write<CR>
        nnoremap <silent> <leader>ge :Git edit<CR>
        " Mnemonic _i_nteractive
        nnoremap <silent> <leader>gi :Git add -p %<CR>
        nnoremap <silent> <leader>gg :SignifyToggle<CR>
    endif
=======
" Conceal Cursor {
    let g:vim_markdown_conceal = 0
    let g:vim_json_syntax_conceal = 0
" }

" GitGutter {
    let g:gitgutter_sign_added = "\uF458"
    let g:gitgutter_sign_modified = "\uF45A"
    let g:gitgutter_sign_removed = "\uF459"
    let g:gitgutter_sign_modified_removed = "\uF45B"
" }

" Fugitive {
    nnoremap <silent> <leader>gs :Gstatus<CR>
    nnoremap <silent> <leader>gd :G diff<CR>
    nnoremap <silent> <leader>gc :G commit -v<CR>
    nnoremap <silent> <leader>gb :G blame<CR>
    nnoremap <silent> <leader>gl :G log<CR>
    nnoremap <silent> <leader>gp :G push<CR>
    nnoremap <silent> <leader>gr :G read<CR>
    nnoremap <silent> <leader>gw :G write<CR>
    nnoremap <silent> <leader>ge :G edit<CR>
    " Mnemonic _i_nteractive
    nnoremap <silent> <leader>gi :Git add -p %<CR>
    nnoremap <silent> <leader>gg :SignifyToggle<CR>
>>>>>>> 4316c48 (Add in nvim files;)
" }

" Ledger Configurations & Hacks {
    map <leader>$$ :Tabularize / \( \\|-\)\?\$.\+<cr>
    if !exists("g:today_command")
      let g:today_command = "today -c"
    endif
    function! GetTodayAndCopy()
      silent execute "!" . g:today_command
      silent !
      redraw!
    endfunction
    silent! map <leader>dd :call GetTodayAndCopy()<cr>
" }

" File-type mapping {
    au BufRead,BufNewFile *.jshintrc set ft=json
    au BufRead,BufNewFile *.bowerrc set ft=json
    au BufRead,BufNewFile *.pantheonrc set ft=json
    au BufRead,BufNewFile *.eslintrc set ft=json
    au BufRead,BufNewFile *.txt set ft=markdown
    au BufRead,BufNewFile *.text set ft=markdown
    au BufRead,BufNewFile *.applescript set ft=applescript
    au BufNewFile,BufRead *.php set ft=php.html.js.css
    au BufNewFile,BufRead *.blade.php set ft=blade.html.php
    au BufNewFile,BufRead *.ejs set ft=liquid.html.js.css
    au BufNewFile,BufRead *.twig set ft=html.twig
    au BufNewFile,BufRead *.toml set ft=toml
    au BufNewFile,BufRead *.js set ft=javascript.jsx
<<<<<<< HEAD
    au BufNewFile,BufRead nginx.config set ft=nginx
    au BufRead,BufNewFile spec set ft=yaml
    au BufNewFile,BufRead *.ledger set ft=ledger
    au BufNewFile,BufRead .env* set ft=sh
" }

" File-type configuration {
    au FileType markdown setlocal shiftwidth=4 tabstop=4 wrap spell expandtab tw=80 wm=0 linebreak list
    au FileType yaml setlocal shiftwidth=2 tabstop=2 nowrap spell expandtab tw=80 wm=0 linebreak list
    au FileType gitcommit setlocal shiftwidth=4 tabstop=4 expandtab wrap spell tw=72 wm=0 linebreak list
=======
    au BufNewFile,BufRead nginx.conf set ft=nginx
    au BufRead,BufNewFile spec set ft=yaml
    au BufNewFile,BufRead *.ledger set ft=ledger
    au BufNewFile,BufRead .env* set ft=sh
    au BufNewFile,BufRead .gitignore set ft=config
" }

" File-type configuration {
    au FileType markdown setlocal conceallevel=0 shiftwidth=4 tabstop=4 wrap spell expandtab tw=80 wm=0 linebreak list
    au FileType yaml setlocal shiftwidth=2 tabstop=2 nowrap spell expandtab tw=80 wm=0 linebreak list foldlevelstart=20
    au FileType gitcommit setlocal shiftwidth=4 tabstop=4 expandtab wrap spell tw=72 wm=0 linebreak list
    au FileType go setlocal shiftwidth=8 tabstop=8
>>>>>>> 4316c48 (Add in nvim files;)
" }
