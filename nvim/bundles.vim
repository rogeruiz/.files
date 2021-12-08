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
        Plug 'editorconfig/editorconfig-vim'
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
        Plug 'liuchengxu/vista.vim'
        Plug 'xolox/vim-easytags'
        Plug 'xolox/vim-misc'
        Plug 'MarcWeber/vim-addon-mw-utils'
        Plug 'tomtom/tlib_vim'
        Plug 'garbas/vim-snipmate'
        Plug 'honza/vim-snippets'
    " }
    " Language {
        " Elixir {
            Plug 'elixir-lang/vim-elixir'
            Plug 'carlosgaldino/elixir-snippets'
            Plug 'mattreduce/vim-mix'
            Plug 'mmorearty/elixir-ctags'
            Plug 'frost/vim-eh-docs'
            Plug 'mhinz/vim-mix-format'
        " }
        " Rustlang {
            Plug 'dan-t/rusty-tags'
            Plug 'rust-lang/rust.vim'
        " }
        " Golang {
            Plug 'fatih/vim-go'
        " }
        " Gemini {
            Plug 'https://git.sr.ht/~torresjrjr/gemini.vim'
        " }
        " Configuration {
            Plug 'kevinoid/vim-jsonc'
            Plug 'roalddevries/yaml.vim'
            Plug 'stephpy/vim-yaml'
            Plug 'toml-lang/toml'
            Plug 'cespare/vim-toml'
            Plug 'maralla/vim-toml-enhance'
        " }
        " GraphQL {
            Plug 'jparise/vim-graphql'
        " }
        " JavaScript {
            Plug 'pangloss/vim-javascript'
            Plug 'jelera/vim-javascript-syntax'
            Plug 'othree/javascript-libraries-syntax.vim'
            Plug 'moll/vim-node'
            Plug 'marijnh/tern_for_vim'
            Plug 'maxmellon/vim-jsx-pretty'
            " TypeScript {
                Plug 'leafgarland/typescript-vim'
                Plug 'peitalin/vim-jsx-typescript'
            " }
        " }
        " Templating {
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
            Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
        " }
        Plug 'ekalinin/Dockerfile.vim'
        Plug 'andrewstuart/vim-kubernetes'
        Plug 'markcornick/vim-terraform'
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
