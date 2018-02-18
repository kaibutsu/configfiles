call plug#begin('~/.config/nvim/plugged')

" Plugins {
    " Code completion
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

	" Auto comment
	Plug 'tomtom/tcomment_vim'

	" Auto Formatting
	Plug 'sbdchd/neoformat'

	" NERDTree file tree popup
    Plug 'scrooloose/nerdtree'

	" Nice little icons
	Plug 'ryanoasis/vim-devicons'

	" ctrl-p is a fuzzy file finder.
    Plug 'kien/ctrlp.vim'

	" Surround stuff
    Plug 'tpope/vim-surround'

	" Easymotion
	Plug 'easymotion/vim-easymotion'

	" airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

	" Some colorschemes
    Plug 'altercation/vim-colors-solarized'
	Plug 'rhysd/vim-color-spring-night'

	" Clean and fix trailing whitespaces
    Plug 'bronson/vim-trailing-whitespace'

	" Color highlighting
	Plug 'ap/vim-css-color'

	" Coding languages support
	Plug 'sheerun/vim-polyglot'
    Plug 'mattn/emmet-vim'

	" Syntax checking
	Plug 'neomake/neomake'

	" Git integration
	Plug 'tpope/vim-fugitive'
	Plug 'airblade/vim-gitgutter'
	Plug 'Xuyuanp/nerdtree-git-plugin'

	" Unite and SilverSurfer for project-wide search {
		"   ------------- VERY IMPORTANT ------------
		"   you have to go to .vim/plugin/vimproc.vim and do a ./make
		"   -----------------------------------------
		Plug 'Shougo/vimproc.vim'
		Plug 'Shougo/unite.vim'
		Plug 'rking/ag.vim'
	" }

    " Alignment
    Plug 'junegunn/vim-easy-align'

    " LaTex support
    Plug 'donRaphaco/neotex', { 'for': 'tex' }
 " }
call plug#end()

" General {
    " Enable Indentation
    filetype plugin indent on
    " Smart indentation
    set smartindent
    " Timeout for double taps
    set ttimeout
    set ttimeoutlen=100
    " Set standard encoding
    set encoding=utf-8
    " Press 'vv' for linewise selection
    nnoremap vv V
    " Better use of j and k
    inoremap jk <ESC>
    inoremap kj <ESC>
    nnoremap j gj
    nnoremap k gk
    " Map the leader key to ,
    let mapleader=","
    " Mark 'psychological' break column
    set colorcolumn=80
    " Fix characters in vterm
    ":set guicursor=
" }

" Search {
    set ignorecase          " Make searching case insensitive
    set smartcase           " ... unless the query has capital letters.
    set gdefault            " Use 'g' flag by default with :s/foo/bar/.

    " Use <ESC> to clear the highlighting of :set hlsearch.
	map <silent> <ESC> :noh<CR>
" }

" Formatting {
    set showmatch           " Show matching brackets.
    set number              " Show the line numbers on the left side.
    set formatoptions+=o    " Continue comment marker in new lines.
    set textwidth=0         " Hard-wrap long lines as you type them.
    set expandtab           " Insert spaces when TAB is pressed.
    set tabstop=4           " Render TABs using this many spaces.
    set shiftwidth=4        " Indentation amount for < and > commands.

    set linespace=0         " Set line-spacing to minimum.
    set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

    " More natural splits
    set splitbelow          " Horizontal split below current.
    set splitright          " Vertical split to right of current.

    if !&scrolloff
        set scrolloff=3       " Show next 3 lines while scrolling.
    endif
    if !&sidescrolloff
        set sidescrolloff=5   " Show next 5 columns while side-scrolling.
    endif
    set nostartofline       " Do not jump to first character with page commands.

    " Tell Vim which characters to show for expanded TABs,
    " trailing whitespace, and end-of-lines. VERY useful!
    if &listchars ==# 'eol:$'
        set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
    endif
    set list                " Show problematic characters.

    " Enable js-beautify
    nnoremap <leader>ff :%!js-beautify --editorconfig -q -f -<CR>
" }

" Configuration {
    set autochdir           " Switch to current file's parent directory.

    " Remove special characters for filename
    set isfname-=:
    set isfname-==
    set isfname-=+

    " Map ; to :
    nnoremap ; :

    if &undolevels < 200
        set undolevels=200    " Number of undo levels.
    endif

   " Path/file expansion in colon-mode.
    set wildmode=list:longest
    set wildchar=<TAB>

    " Allow color schemes to do bright colors without forcing bold.
    if &t_Co == 8 && $TERM !~# '^linux'
        set t_Co=16
    endif

    " Diff options
    set diffopt+=iwhite

" UI Options {
    " Colorscheme options.
    syntax enable
    set background=dark
    "colorscheme solarized
    colorscheme spring-night

    " Also highlight all tabs and trailing whitespace characters.
    highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
    match ExtraWhitespace /\s\+$\|\t/

    " Relative numbering
    function! NumberToggle()
        if(&relativenumber == 1)
            set nornu
            set number
        else
            set rnu
        endif
    endfunc

    " Toggle between normal and relative numbering.
    nnoremap <leader>r :call NumberToggle()<cr>
" }

" Keybindings {
    " Save file
    nnoremap <Leader>w :w<CR>

    " Copy and paste from system clipboard (Might require xsel/xclip install)
"    vmap <Leader>y "+y
"    vmap <Leader>d "+d
"    nmap <Leader>p "+p
"    nmap <Leader>P "+P
"    vmap <Leader>p "+p
"    vmap <Leader>P "+P

    " Move between buffers
    nmap <Leader>l :bnext<CR>
    nmap <Leader>h :bprevious<CR>
" }

" Plugin Settings {
    " CtrlP {
        " Open file menu
        nnoremap <Leader>o :CtrlP<CR>
        " Open buffer menu
        nnoremap <Leader>b :CtrlPBuffer<CR>
        " Open most recently used files
        nnoremap <Leader>u :CtrlPMRUFiles<CR>
    " }

    " Unite {
        let g:unite_source_history_yank_enable = 1
        try
            let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
            call unite#filters#matcher_default#use(['matcher_fuzzy'])
        catch
        endtry
        " search a file in the filetree
        nnoremap <space><space> :split<cr> :<C-u>Unite -start-insert file_rec/async<cr>
    " }

    " TheSilverSurfer {
        " type ° to search the word in all files in the current dir
        nmap ° :Ag <c-r>=expand("<cword>")<cr><cr>
        nnoremap <space>/ :Ag
    " }

    " Deoplete {
        let g:deoplete#enable_at_startup = 1
    " }

    " NERDTree {
        nmap <silent> <F2> :NERDTreeToggle <CR>
    " }

	" Airline {
        let g:airline_powerline_fonts = 1
        let g:airline_solarized_bg='dark'
        let g:airline_theme = 'spring_night'
    " }

	" Neoformat {
		noremap <silent> <leader>f :Neoformat<CR>
	" }

	" TComment {
		vnoremap <silent> <leader># :TComment<cr>
		nnoremap <silent> <leader><leader># :TComment<cr>
	" }

	" NeoMake {
		"Execute when writing a buffer
		call neomake#configure#automake('w')
	" }

    " neotex {
        " 1: Enable by :NeoTexOn, 2: always on
        "let g:neotex_enabled = 1
        "let g:neotex_latexdiff = 1
    " }
" }

" vim:set ft=vim sw=4 ts=4:
