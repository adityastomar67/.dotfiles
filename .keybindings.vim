
" KEYBINDING HACKS
vnoremap < <gv
vnoremap > >gv

" Keybindings for coc-explorer
nnoremap <silent> tt :CocCommand explorer<CR>

" Yank all content
nnoremap <leader>y ggVGy<C-o>
nnoremap Y y$

" Run text from line as command
nmap Q :.!sh<CR>

" Undo break points
inoremap , ,<C-g>u
inoremap . .<C-g>u

" Keeping it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Jumplist mutation
" nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") 'j'
" nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") 'k'

" Vertically center documents when in insert mode
autocmd InsertEnter * norm zz

" Remapping escape key
inoremap ;; <Esc>

" Disabling Escape key
" inoremap <Esc> <Nop>

" Remap za to space
" nnoremap <space> za

" Map leader
let mapleader = ";"

" Moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
inoremap <A-S-j> <Esc>:m .+1<CR>==i
inoremap <A-S-k> <Esc>:m .-2<CR>==i

" Guide navigation
inoremap <leader><Tab> <Esc>/<++><Enter>"_c4l
noremap <leader><Tab> <Esc>/<++><Enter>"_c4l

" General insert command
inoremap ;g <++>

" Enable and disable spell checker
map <silent> <leader>s :setlocal spell!<CR>

"Enable and disable auto comment
map <leader>c :setlocal formatoptions-=cro<CR>
map <leader>C :setlocal formatoptions=cro<CR>

"Enable and disable auto indentation
map <leader>a :setlocal autoindent<CR>
map <leader>A :setlocal noautoindent<CR>

