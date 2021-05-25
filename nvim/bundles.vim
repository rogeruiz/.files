" Modeline and Notes {
" vim: set sw=4 ts=4 sts=4 et tw=80 foldmarker={,} foldlevel=1 foldmethod=marker spell:
"
" The Plug definitions are below.
"
" }

" Required {
    set nocompatible
    filetype on
    filetype off
    call plug#begin(stdpath('data').'/plugged')
" }

" Plugins {
    " Theme {
        Plug 'mhinz/vim-startify'
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        Plug 'altercation/vim-colors-solarized'
        Plug 'ryanoasis/vim-devicons'
    " }
    " Version Control {
        Plug 'tpope/vim-fugitive'
        Plug 'mattn/gist-vim'
    " }
    " Tmux integration {
        Plug 'benmills/vimux'
        Plug 'edkolev/tmuxline.vim'
    " }
    " Workflow {
        "Plug 'scrooloose/syntastic'
        "Plug 'w0rp/ale'
        Plug 'editorconfig/editorconfig-vim'
        "Plug 'ajh17/VimCompletesMe'
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
        Plug 'mattn/emmet-vim'
        Plug 'sotte/presenting.vim'
        Plug 'scrooloose/nerdcommenter'
        Plug 'kien/rainbow_parentheses.vim'
        Plug 'scrooloose/nerdtree'
        Plug 'myusuf3/numbers.vim'
        Plug 'godlygeek/tabular'
        Plug 'Yggdroot/indentLine'
        Plug 'ctrlpvim/ctrlp.vim'
        Plug 'tpope/vim-surround'
        Plug 'Raimondi/delimitMate'
        Plug 'majutsushi/tagbar'
        Plug 'xolox/vim-easytags'
        Plug 'xolox/vim-misc'
        Plug 'MarcWeber/vim-addon-mw-utils'
        Plug 'tomtom/tlib_vim'
        Plug 'garbas/vim-snipmate'
        Plug 'honza/vim-snippets'
    " }
    " Language {
        " cloud.gov {
            "Plug 'luan/vim-bosh'
            "Plug 'luan/vim-concourse'
            Plug 'ekalinin/Dockerfile.vim'
            Plug 'andrewstuart/vim-kubernetes'
            Plug 'markcornick/vim-terraform'
        " }
        " Elixir {
            Plug 'elixir-lang/vim-elixir'
            Plug 'carlosgaldino/elixir-snippets'
            Plug 'mattreduce/vim-mix'
            Plug 'mmorearty/elixir-ctags'
            Plug 'frost/vim-eh-docs'
        " }
        " Rustlang {
            Plug 'dan-t/rusty-tags'
            Plug 'rust-lang/rust.vim'
        " }
        " Golang {
            Plug 'fatih/vim-go'
        " }
        " Configuration {
            Plug 'kevinoid/vim-jsonc'
            Plug 'roalddevries/yaml.vim'
            Plug 'stephpy/vim-yaml'
            Plug 'toml-lang/toml'
            Plug 'cespare/vim-toml'
            Plug 'maralla/vim-toml-enhance'
        " }
        " JavaScript {
            Plug 'pangloss/vim-javascript'
            Plug 'jelera/vim-javascript-syntax'
            Plug 'othree/javascript-libraries-syntax.vim'
            Plug 'moll/vim-node'
            Plug 'marijnh/tern_for_vim'
            Plug 'mxw/vim-jsx'
        " }
        " Templating {
            "Plug 'evidens/vim-twig'
            "Plug 'VuogNguyen/vim-blade'
            Plug 'mustache/vim-mustache-handlebars'
        " }
        " Markdown {
            Plug 'plasticboy/vim-markdown'
            Plug 'jszakmeister/markdown2ctags'
            " Markdown Preview {
                Plug 'mattn/webapi-vim'
                Plug 'kannokanno/previm'
                Plug 'tyru/open-browser.vim'
            " }
        " }
        " Cascading Style Sheets {
            Plug 'hail2u/vim-css3-syntax'
            Plug 'cakebaker/scss-syntax.vim'
            "Plug 'groenewege/vim-less'
        " }
        Plug 'StanAngeloff/php.vim'
        Plug 'tpope/vim-rails'
        Plug 'vim-scripts/applescript.vim'
        Plug 'vim-scripts/nginx.vim'
        Plug 'ledger/vim-ledger'
        Plug 'othree/html5.vim'
        Plug 'tpope/vim-ragtag'
        Plug 'udalov/kotlin-vim'
        Plug 'davidhalter/jedi-vim'
        Plug 'neovim/nvim-lspconfig'
    " }
" }

" Required {
    call plug#end()
" }
