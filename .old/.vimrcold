" ░░░██╗░░░██╗██╗███╗░░░███╗██████╗░░█████╗░
" ░░░██║░░░██║██║████╗░████║██╔══██╗██╔══██╗
" ░░░╚██╗░██╔╝██║██╔████╔██║██████╔╝██║░░╚═╝
" ░░░░╚████╔╝░██║██║╚██╔╝██║██╔══██╗██║░░██╗
" ██╗░░╚██╔╝░░██║██║░╚═╝░██║██║░░██║╚█████╔╝
" ╚═╝░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝╚═╝░░╚═╝░╚════╝░

" REQUIRED {{{ 

runtime! debian.vim

set nocompatible              " be iMproved, required
filetype off                  " required

" source /home/adi/.filetype.vim
" source /home/adi/.abbreviations.vim
" source /home/adi/.keybindings.vim
" }}}

" PLUGINS {{{

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin('~/.vim/plugins')

Plugin 'VundleVim/Vundle.vim'

" Customization
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'			" For icons
Plugin 'dracula/vim', { 'name': 'dracula' } 

" Must have
Plugin 'tpope/vim-surround'    
Plugin 'scrooloose/nerdtree'			" added nerdtree
Plugin 'junegunn/goyo.vim'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-eunuch'
Plugin 'mhinz/vim-startify'

Plugin 'komissarex/vim-progress'

" Web Development
Plugin 'ap/vim-css-color'
Plugin 'mattn/emmet-vim'

" Python Development
Plugin 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" Syntax highlighting
Plugin 'vim-python/python-syntax'
Plugin 'plasticboy/vim-markdown'

" Vim Wiki
Plugin 'vimwiki/vimwiki'

call vundle#end()

" }}}

" BASIC CONFIGURATION {{{

filetype plugin indent on
syntax enable
set noswapfile
set number relativenumber
set path+=**
set wildmode=longest,list,full
set wildignore=*.o,*.obj,*.bak,*.exe,*.hi,*.dyn_hi,*.dyn_o,*.zip,*.pdf
set encoding=UTF-8
set nofoldenable
set foldmethod=marker
set foldmarker={{{,}}}
set nocursorline
set showmatch				" Show matching brackets.
set linebreak
set ignorecase				" Do case insensitive matching
set smartcase				" Do smart case matching
set clipboard+=unnamedplus	" Use System Clipboard
set mouse=a					" Enable mouse usage (all modes)
set tabstop=4     
set shiftwidth=4  
set softtabstop=4 
set spelllang=en_us
set fillchars+=vert:│,fold:-,eob:\ 
set nolist
set listchars=tab:│\ 

colorscheme dracula
hi Normal ctermbg=NONE

" Highlight Whitespaces
highlight Whitespace ctermfg=Grey

" Makes comments italic
highlight Comment cterm=italic

" Customize spell check highlighting
highlight SpellBad ctermbg=Red ctermfg=White
highlight SpellCap cterm=NONE ctermbg=NONE
highlight SpellRare cterm=NONE ctermbg=NONE
highlight SpellLocal cterm=undercurl ctermbg=NONE

" Customize cursor line
highlight CursorLine cterm=NONE ctermbg=Black 
" highlight CursorLineNr cterm=Bold ctermbg=Black ctermfg=White

" highlight LineNr ctermbg=NONE ctermfg=White
highlight VertSplit ctermbg=NONE ctermfg=White

" Customize folds
highlight Folded ctermfg=White ctermbg=NONE cterm=bold

" Vertically center documents when in insert mode
" autocmd InsertEnter * norm zz

" }}}

" VIMWIKI {{{

let g:vimwiki_list = [{'auto_diary_index': 1}]

" }}}

" MARKDOWN {{{
let g:vim_markdown_folding_disabled = 0
let g:vim_markdown_toc_autofit = 1
" }}}

" STARTIFY {{{

let g:startify_files_number = 10
let g:startify_update_oldfiles = 1
let g:startify_change_to_vcs_root = 0
let g:startify_padding_left = 4
let g:startify_session_autoload = 0
let g:startify_session_dir = '~/.vim/session'
" let g:startify_custom_header =
"             \ startify#pad(split(system('figlet -f chunky technicaldc'), '\n'))

let g:startify_lists = [
          \ { 'type': 'bookmarks', 'header': ['   BOOKMARKS:']      },
          \ { 'type': 'files',     'header': ['   RECENTS:']            },
          \ { 'type': 'dir',       'header': ['   CURRENT DIRECTORY: '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   SESSIONS:']       },
          \ { 'type': 'commands',  'header': ['   COMMANDS:']       },
          \ ]

let g:startify_bookmarks = [
		\ { 'f': '~/.filetype.vimrc' },
		\ { 'g': '~/github_token.md' },
		\ { 'v': '~/.vimrc' },
		\ { 'w': '~/vimwiki/index.wiki' },
		\ { 'z': '~/.zshrc' },
		\]

let g:startify_custom_header = [ "", 
	\ "",
	\ "	███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗		",
	\ "	████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║      ",
	\ "	██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║      ",
	\ "	██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║      ",
	\ "	██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║		",
	\ "	╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝		",
	\ "",
	\ ]

let g:startify_custom_footer = ''

highlight StartifyBracket ctermfg=Green
highlight StartifySlash ctermfg=Green
highlight StartifyFile ctermfg=Yellow
highlight StartifySection cterm=Bold ctermfg=Red
highlight StartifySpecial ctermfg=Magenta

" }}}

" EMMET-VIM {{{

let g:user_emmet_leader_key='<C-Z>'
let g:user_emmet_mode='a'    "enable all function in all mode.
" let g:user_emmet_install_global = 0
" autocmd FileType html,css EmmetInstall

" }}}

" VIM AIRLINE THEME {{{

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0
" let g:airline_theme='murmur'
" let g:airline_theme='minimalist'
let g:airline_theme='dracula'

" }}}

" NERD TREE CONFIG {{{

nnoremap <silent> tt :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers=0
let NERDTreeShowHidden=0
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=23

" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" }}}

" NERD COMMENTER {{{

" Key binding for comment: ',cc'
" Key binding for uncomment: ',cu'

" Create default mappings
let g:NERDCreateDefaultMappings = 0

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 0

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" }}}

" GOYO {{{

let g:goyo_width = 80
let g:goyo_height = 30
let g:goyo_liner = 0

map <silent> <leader>gy :Goyo<CR> 

" }}}

" COC {{{

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=auto
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
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

" }}}

" LATEX PREVIEW {{{

let g:livepreview_previewer = 'zathura'
let g:livepreview_engine = 'xelatex' 

map <leader>lp :LLPStartPreview<CR>

" }}}

" FZF {{{

" This is the default option:
"   - Preview window on the right with 50% width
"   - CTRL-/ will toggle preview window.
" - Note that this array is passed as arguments to fzf#vim#with_preview function.
" - To learn more about preview window options, see `--preview-window` section of `man fzf`.
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" Preview window on the upper side of the window with 40% height,
" hidden by default, ctrl-/ to toggle
let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']

" Empty value to disable preview window altogether
let g:fzf_preview_window = []

 
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>e :History<CR>

command! -bang -nargs=? -complete=dir Files
			\ call fzf#vim#files(<q-args>, {'options': ['--preview', 'batcat {}']}, <bang>0)
command! -bang -nargs=? -complete=dir GFiles
			\ call fzf#vim#gitfiles(<q-args>, {'options': ['--preview', 'batcat {}']}, <bang>0)

" }}}

" TABS, SPLITS AND BUFFERS {{{

" MANAGING BUFFERS
nnoremap <A-C> :bprevious<CR>
nnoremap <A-c> :bnext<CR>

" MANAGING TABS
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <A-t> :TabVifm<CR>
nnoremap <silent> <A-n> :tabnew<CR> 
nnoremap <silent> <A-,> :tabmove -<CR>
nnoremap <silent> <A-.> :tabmove +<CR>

" MANAGING SPLITS
set splitbelow splitright

" Open terminal in split
nnoremap <leader>st :sp<space>\|<space>terminal<CR>
nnoremap <leader>vt :vs<space>\|<space>terminal<CR>

" Change splits from vertical to horizontal and vice versa
" Horizontal to vertical
map <leader>th <C-w>t<C-w>H
" Vertical to horizontal
map <leader>tk <C-w>t<C-w>K

" Remap splits navigation to just ( Ctrl + hjkl)
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Keybindings for split resizing
noremap <silent> <A-l> :vertical resize +2<CR>
noremap <silent> <A-h> :vertical resize -2<CR>
noremap <silent> <A-k> :resize +2<CR>
noremap <silent> <A-j> :resize -2<CR>

" }}}

" OTHER {{{

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" vimrc:fdm=marker:foldlevel=0

" }}}
