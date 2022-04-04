"██╗███╗░░██╗██╗████████╗░░░██╗░░░██╗██╗███╗░░░███╗
"██║████╗░██║██║╚══██╔══╝░░░██║░░░██║██║████╗░████║
"██║██╔██╗██║██║░░░██║░░░░░░╚██╗░██╔╝██║██╔████╔██║
"██║██║╚████║██║░░░██║░░░░░░░╚████╔╝░██║██║╚██╔╝██║
"██║██║░╚███║██║░░░██║░░░██╗░░╚██╔╝░░██║██║░╚═╝░██║
"╚═╝╚═╝░░╚══╝╚═╝░░░╚═╝░░░╚═╝░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝

""" PLUGINS - vim-plug
call plug#begin('~/.config/nvim/plugged')

    Plug 'airblade/vim-rooter'
    Plug 'ap/vim-css-color'
    Plug 'ctrlpvim/ctrlp.vim' 
    Plug 'dylanaraps/wal.vim'
    Plug 'fisadev/vim-isort'
    Plug 'Valloric/YouCompleteMe'
    Plug 'akinsho/toggleterm.nvim'
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
    Plug 'github/copilot.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'morhetz/gruvbox'
    Plug 'neoclide/coc.nvim', {'branch': 'release'} 
    Plug 'numToStr/Comment.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope-file-browser.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'psf/black', { 'branch': 'main' }
    Plug 'tpope/vim-markdown'
    Plug 'vim-scripts/fountain.vim'
    Plug 'rebelot/kanagawa.nvim'

call plug#end()

""" Lua calls for Plugins
lua require('Comment').setup()
lua require'nvim-tree'.setup()

""" General Settings
set encoding=UTF-8 nobackup nowritebackup nocursorline splitbelow splitright wildmode=longest,list,full
set shiftwidth=4 autoindent smartindent tabstop=4 softtabstop=4 expandtab spell spelllang=en_us
set fillchars+=eob:\ 
set clipboard+=unnamedplus
set background=dark
set termguicolors
set updatetime=1000
au BufRead,BufNewFile *.fountain set filetype=fountain

""" Usage of Mouse
if has('mouse')
  if &term =~ 'xterm'
    set mouse=a
  else
    set mouse=nvi
  endif
endif

""" Status Line
set laststatus=0
set statusline+=%#NonText#
set statusline+=%=
set statusline+=\ %f
set statusline+=\ 
set statusline+=%#CursorLineNr#
set statusline+=\ %y
set statusline+=\ %r
set statusline+=%#IncSearch#
set statusline+=\ %l/%L
set statusline+=\ [%c]

""" Sourcing 
source $HOME/.keybindings.vim
source $HOME/.filetype.vim
source $HOME/.abbreviations.vim

""" NvimTree
let g:nvim_tree_indent_markers = 1 
let g:nvim_tree_git_hl = 1 
let g:nvim_tree_highlight_opened_files = 1 
let g:nvim_tree_root_folder_modifier = ':~' 
let g:nvim_tree_add_trailing = 1 
let g:nvim_tree_group_empty = 1 
let g:nvim_tree_icon_padding = ' ' 
let g:nvim_tree_symlink_arrow = ' >> ' 
let g:nvim_tree_respect_buf_cwd = 1 
let g:nvim_tree_create_in_closed_folder = 1 
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } 
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ 'folder_arrows': 1,
    \ }
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   }
    \ }
highlight NvimTreeFolderIcon guibg=blue

colorscheme kanagawa

"" For Background Transparency
hi Normal guibg=NONE ctermbg=NONE 

""" Goyo Settings
function! s:goyo_enter()
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
endfunction

function! s:goyo_leave()
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
  hi! Normal ctermbg=NONE guibg=NONE 
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

""" FZF Settings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_tags_command = 'ctags -R'

"" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

"" FZF defaults
let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline --bind tab:down,shift-tab:up'
let $FZF_DEFAULT_COMMAND="rg --files --hidden -g '!.git/'"

"" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColoumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"" Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

"" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

"" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

"" Git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)


""" This triggers all formatting before coc linter is triggered
aug python
    au!
    autocmd BufWritePre *.py Isort
    autocmd BufWritePre *.py Black
aug END
