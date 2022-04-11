"█▄▀ █▀▀ █▄█ █▄▄ █ █▄░█ █▀▄ █ █▄░█ █▀▀ █▀
"█░█ ██▄ ░█░ █▄█ █ █░▀█ █▄▀ █ █░▀█ █▄█ ▄█

let mapleader=" "
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>rg :Rg<CR>
nnoremap <leader>t :TermExec size=30 direction=float cmd="clear"<CR>
nnoremap <leader>m :Marks<CR>
nnoremap <leader>s :BLines<CR>
nnoremap <leader>sr :source ~/.config/nvim/init.vim<CR>
nnoremap <leader><ENTER> :Goyo<CR>
nnoremap <leader><Space> :CtrlP<CR>
nnoremap <leader>n :Lex!<CR>
nnoremap <leader>z :set invrnu invnu<CR>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>er :CocDiagnostics<CR>
nnoremap <leader>lg :LazyGit<CR>
nnoremap <C-e> :NvimTreeToggle<CR>
nnoremap <C-o> :Files<CR>

""" WRITING & EXITING
nnoremap Q :q!<CR>
nnoremap q :q<CR>
nnoremap W :wq<CR>
nnoremap <C-s> :w<CR>

""" ESC Remap
imap qq <Esc>

""" Command For Reatime Updating File
command Realtime :set autoread | au CursorHold * checktime | call feedkeys("G")

" Run text from line as command
nmap <S-r> :.!sh<CR>

""" PAIRING BRACES
inoremap <> <><Left>
inoremap () ()<Left>
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap `` ``<Left>

""" NAVIGATIONAL KEYS
nmap <Up>    <Nop>
nmap <Down>  <Nop>
nmap <Left>  <Nop>
nmap <Right> <Nop>

map $ <Nop>
map ^ <Nop>
map { <Nop>
map } <Nop>

noremap K     {
noremap J     }
noremap H     ^
noremap L     $

nnoremap <C-h> :bprev<CR>
nnoremap <C-l> :bnext<CR>

"" For going back to previous buffer by closing current buffer in same pane
noremap <C-x> :bp<Bar>bd #<Cr>

"" Yank all content
nnoremap <leader>y ggVGy

"" Yank till the end of the line
nnoremap Y y$

""" TESTING
" nnoremap <leader><C-l> :set nofoldenable<CR>
" nnoremap <C-l> :set foldmethod=indent<CR>
" xnoremap K :move '<-2<CR>gv-gv
" xnoremap J :move '>+1<CR>gv-gv
" nnoremap <Up>    :resize -2<CR>
" nnoremap <Down>  :resize +2<CR>
" nnoremap <Left>  :vertical resize +2<CR>
" nnoremap <Right> :vertical resize -2<CR>
" nnoremap <C-Space>- :sp<CR>
" nnoremap <C-Space>\ :vsp<CR>
" nnoremap <C-k> :set foldmethod=syntax<CR>

" KEYBINDING HACKS
"vnoremap < <gv
"vnoremap > >gv
"
"" Keybindings for coc-explorer
"nnoremap <silent> tt :CocCommand explorer<CR>
"
"" Undo break points
"inoremap , ,<C-g>u
"inoremap . .<C-g>u
"
"" Keeping it centered
"nnoremap n nzzzv
"nnoremap N Nzzzv
"nnoremap J mzJ`z
"
"" Jumplist mutation
"" nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") 'j'
"" nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") 'k'
"
"" Vertically center documents when in insert mode
"autocmd InsertEnter * norm zz
"
"" Remapping escape key
"inoremap ;; <Esc>
"
"" Disabling Escape key
"" inoremap <Esc> <Nop>
"
"" Remap za to space
"" nnoremap <space> za
"
"" Map leader
"let mapleader = ";"
"
"" Moving text
"vnoremap J :m '>+1<CR>gv=gv
"vnoremap K :m '<-2<CR>gv=gv
"nnoremap <leader>j :m .+1<CR>==
"nnoremap <leader>k :m .-2<CR>==
"inoremap <A-S-j> <Esc>:m .+1<CR>==i
"inoremap <A-S-k> <Esc>:m .-2<CR>==i
"
"" Guide navigation
"inoremap <leader><Tab> <Esc>/<++><Enter>"_c4l
"noremap <leader><Tab> <Esc>/<++><Enter>"_c4l
"
"" General insert command
"inoremap ;g <++>
"
"" Enable and disable spell checker
"map <silent> <leader>s :setlocal spell!<CR>
"
""Enable and disable auto comment
"map <leader>c :setlocal formatoptions-=cro<CR>
"map <leader>C :setlocal formatoptions=cro<CR>
"
""Enable and disable auto indentation
"map <leader>a :setlocal autoindent<CR>
"map <leader>A :setlocal noautoindent<CR>
