" Modeline and Notes {
" vim: set sw=4 ts=4 sts=4 et tw=80 foldmarker={,} foldlevel=0 foldmethod=marker:
"
" Organizing my .vimrc files
" I'm borrowing everything from [here](https://github.com/spf13/spf13-vim) and
" am super thankful that Steve Francia has that super helpful guide to his own
" `.vimrc` but also that [he made this](http://vim.spf13.com) for anyone that
" wants to use his standards out-of-the-box without much configurations.
"
" This is still very much a work-in-progress, but I'm finally at a point where
" my original `.vimrc` was making me feel disorganized.
"
" }

" Basics {
    let mapleader = ","
    set magic
    set shell=/bin/zsh
    set modeline
    set modelines=5
    set cmdheight=1
    set updatetime=100
    set cursorline
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
    set completeopt=menuone
    set lbr
    set ai
    set si
    set nowrap
    set laststatus=2
" }

" Load Bundle config {
    if filereadable(expand("~/.config/nvim/bundles.vim"))
        source ~/.config/nvim/bundles.vim
    endif
" }

" Worflow {
    map 0 ^
    map <f8> :TagbarToggle<cr>
    " Shortcut for disabling highlighting
    nnoremap <silent> <C-l> :nohl<CR><C-l>
    " Shortcut for enabling and disabling paste mode
    map <leader>pp :setlocal paste!<cr>
    " Shortcut for enabling spelling
    map <leader>ss :setlocal spell!<cr>
    " Allow for macosx and tmux and vim clipboard sharing.
    " Following this blog post: http://evertpot.com/osx-tmux-vim-copy-paste-clipboard/
    set clipboard=unnamed
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
    let g:coc_global_extensions = [
        \  'coc-ccls',
        \  'coc-diagnostic',
        \  'coc-docker',
        \  'coc-elixir',
        \  'coc-ember',
        \  'coc-emmet',
        \  'coc-git',
        \  'coc-go',
        \  'coc-highlight',
        \  'coc-html',
        \  'coc-htmldjango',
        \  'coc-html-css-support',
        \  'coc-htmlhint',
        \  'coc-json',
        \  'coc-lua',
        \  'coc-pyright',
        \  'coc-rust-analyzer',
        \  'coc-sh',
        \  'coc-sql',
        \  'coc-swagger',
        \  'coc-toml',
        \  'coc-yaml'
    \ ]

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

   if has('nvim-0.4.3') || has('patch-8.2.0750')
          nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
          nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
          inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
          inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    endif
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
    set foldlevelstart=20
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
        \ 'ctagsbin'  : expand("~/Developer/golang/bin/flytags"),
        \ 'ctagsargs' : '-sort -silent'
    \ }
    " Add support for markdown files in tagbar.
    let g:tagbar_type_markdown = {
        \ 'ctagstype': 'markdown',
        \ 'ctagsbin' : '/usr/local/bin/markdown2ctags.py',
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
        let g:easytags_cmd = '/usr/local/bin/ctags'
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
    nnoremap <leader>gld :GoDef<CR>
    inoremap <leader>gld <ESC>:GoDef<CR>
    vnoremap <leader>gld <ESC>:GoDef<CR>

    let g:go_list_type = "quickfix"
    func! RunGoFmt()
        exe "GoFmt"
    endfunc
    autocmd BufWrite *.go :call RunGoFmt()

    autocmd FileType go let b:vcm_tab_complete = "omni"

" }

" Elixir {

    let g:mix_format_on_save = 1

" }

" Airline Preferences {
    let g:airline_powerline_fonts = 0
    let g:airline#extensions#whitespace#mixed_indent_algo = 1
    let g:airline#extensions#whitespace#enabled = 1
    let g:airline#extensions#syntastic#enabled = 1
    let g:airline#extensions#tmuxline#enabled = 1

    if ! exists( 'g:airline_symbols' )
        let g:airline_symbols = {}
        let g:airline_left_sep = "\ue0b0"
        let g:airline_right_sep = " \ue0b2"
        let g:airline_symbols.space = "\uA0"
        let g:airline_symbols.crypt = "  \uf023 "
        let g:airline_symbols.linenr = " \uf1dd "
        let g:airline_symbols.branch = " \ue702 "
        let g:airline_symbols.paste = " \uf0d0 "
        let g:airline_symbols.whitespace = " \uf1fc "
        let g:airline_symbols.notexists = " \uf440"
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
      \'a'    : [ '#(echo "\uf02b ") #S #(echo "\uf277 ") #I.#P #(/usr/local/bin/outatime)' ],
      \'b'    : [ ' #(current_wifi_network) ', ' #(~/.tmux/tmux-network-bandwidth/scripts/network-bandwidth.sh)' ],
      \'win'  : [ '#I #W #(echo "\uf248  ")' ],
      \'cwin' : [ '#I #W #(if [[ "#F" == "*" ]]; then echo "\uf247  "; elif [[ "#F" == "*Z" ]]; then echo "\uf0b2 "; elif [[ "#F" == "*M" ]]; then echo "\uf435:"; fi)' ],
      \'x'    : [ '#(battery -tp)  ', ' #(current_itunes_song)' ],
      \'z'    : [ '#(~/.tmux/tmux-weather/scripts/weather.sh) #(echo " \uf017") %H:%M', '#(echo " \uf073 ") %a %m/%d' ] }
    let g:tmuxline_separators = {
          \ 'left' : "\ue0b0",
          \ "left_alt": "\ue0c6",
          \ "right" : "\ue0b2",
          \ "right_alt" : "\ue0c7",
          \ "space" : "\uA0" }
" }

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

" IndentLine {
    let g:indentLine_color_tty_light = 2
    let g:indentLine_color_dark = 1
    let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" }

" Conceal Cursor {
    let g:vim_markdown_conceal = 0
    let g:vim_json_syntax_conceal = 0
    let g:indentLine_noConcealCursor = 1
" }

" Fugitive {
    nnoremap <silent> <leader>gs :Git<CR>
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
    au BufNewFile,BufRead nginx.config set ft=nginx
    au BufRead,BufNewFile spec set ft=yaml
    au BufNewFile,BufRead *.ledger set ft=ledger
    au BufNewFile,BufRead .env* set ft=sh
    au BufNewFile,BufRead Brewfile set ft=ruby
" }

" File-type configuration {
    au FileType markdown setlocal shiftwidth=4 tabstop=4 wrap spell expandtab tw=80 wm=0 linebreak list conceallevel=0
    au FileType json setlocal conceallevel=0
    au FileType yaml setlocal shiftwidth=2 tabstop=2 nowrap spell expandtab tw=80 wm=0 linebreak list
    au FileType gitcommit setlocal shiftwidth=4 tabstop=4 expandtab wrap spell tw=72 wm=0 linebreak list
" }
