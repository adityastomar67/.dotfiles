" ALL FILETYPE {{{
" }}}

" For Neomutt and Mutt
autocmd BufNewFile,BufRead Programs/neomutt/temp/* set noautoindent filetype=mail wm=0 tw=78 nonumber digraph nolist

" PYTHON {{{
autocmd FileType python nnoremap <leader>r !python3 %p

" }}}

" PROGRESS {{{
autocmd BufEnter,BufNewFile *.p set filetype=progress
" }}}

" MARKDOWN {{{

" Headers
autocmd BufEnter,BufNewFile *.md inoremap ;1 #<space>
autocmd BufEnter,BufNewFile *.md inoremap ;2 ##<space>
autocmd BufEnter,BufNewFile *.md inoremap ;3 ###<space>
autocmd BufEnter,BufNewFile *.md inoremap ;4 ####<space>
autocmd BufEnter,BufNewFile *.md inoremap ;5 #####<space>
autocmd BufEnter,BufNewFile *.md inoremap ;6 ######<space>

" Text formatting
autocmd BufEnter,BufNewFile *.md inoremap ;b ****<Esc>hi
autocmd BufEnter,BufNewFile *.md inoremap ;i __<Esc>i
autocmd BufEnter,BufNewFile *.md inoremap ;s ~~~~<Esc>hi

" Image and Link
autocmd BufEnter,BufNewFile *.md inoremap ;ig ![](){#fig:<Space>}<Esc>F]i
autocmd BufEnter,BufNewFile *.md inoremap ;l []()<Esc>F]i

" List
autocmd BufEnter,BufNewFile *.md inoremap ;o 1.<space>
autocmd BufEnter,BufNewFile *.md inoremap ;u *<space>

" Task
autocmd BufEnter,BufNewFile *.md inoremap ;t -<space>[<space>]<space>

" Code block
autocmd BufEnter,BufNewFile *.md inoremap ;cb ```<Enter>```<esc>kA

" }}}

" VIMWIKI {{{

" Headers
autocmd BufEnter,BufNewFile *.wiki inoremap ;1 =<space>
autocmd BufEnter,BufNewFile *.wiki inoremap ;2 ##<space>
autocmd BufEnter,BufNewFile *.wiki inoremap ;3 ###<space>
autocmd BufEnter,BufNewFile *.wiki inoremap ;4 ####<space>
autocmd BufEnter,BufNewFile *.wiki inoremap ;5 #####<space>
autocmd BufEnter,BufNewFile *.wiki inoremap ;6 ######<space>

" Text formatting
autocmd BufEnter,BufNewFile *.wiki inoremap ;b **<Esc>i
autocmd BufEnter,BufNewFile *.wiki inoremap ;i __<Esc>i

" List
autocmd BufEnter,BufNewFile *.wiki inoremap ;no 1)<space>
autocmd BufEnter,BufNewFile *.wiki inoremap ;Ro I)<space>
autocmd BufEnter,BufNewFile *.wiki inoremap ;ro i)<space>
autocmd BufEnter,BufNewFile *.wiki inoremap ;Ao A)<space>
autocmd BufEnter,BufNewFile *.wiki inoremap ;ao a)<space>
autocmd BufEnter,BufNewFile *.wiki inoremap ;u *<space>

" Image and Link
autocmd BufEnter,BufNewFile *.wiki inoremap ;ig ![](){#fig:<Space>}<Esc>F]i
autocmd BufEnter,BufNewFile *.wiki inoremap ;l [[]]<Esc>hi

" Task
autocmd BufEnter,BufNewFile *.wiki inoremap ;t -<space>[<space>]<space>

" Code block
autocmd BufEnter,BufNewFile *.wiki inoremap ;cb {{{<Enter>}}}<esc>kA

" }}}

" LATEX {{{

" Package
autocmd FileType tex inoremap ;up \usepackage{}<Esc>i
autocmd FileType tex inoremap ;fa \usepackage{fontawesome}<Enter>
autocmd FileType tex inoremap ;gy \usepackage[]{geometry}<Esc>F]i
autocmd FileType tex inoremap ;bt \usepackage{blindtext}
autocmd FileType tex inoremap ;fhdr \usepackage{fancyhdr}
autocmd FileType tex inoremap ;eitem \usepackage{enumitem}
autocmd FileType tex inoremap ;grx \usepackage{graphicx}
autocmd FileType tex inoremap ;tocp \usepackage{tocloft}
autocmd FileType tex inoremap ;href \usepackage{hyperref}

" Main stuffs
autocmd FileType tex inoremap ;tit \title{}<Esc>i
autocmd FileType tex inoremap ;aut \author{}<Esc>i
autocmd FileType tex inoremap ;dt \date{}<Esc>i
autocmd FileType tex inoremap ;mt \maketitle<Enter>
autocmd FileType tex inoremap ;toc \tableofcontents<Enter>

" Custom commands
autocmd FileType tex inoremap ;nc \newcommand{}{}<Esc>F}i

" Headers and Footer
autocmd FileType tex inoremap ;fh \fancyhead[]{}<Esc>F]i
autocmd FileType tex inoremap ;ff \fancyfoot[]{}<Esc>F]i

" Sections
autocmd FileType tex inoremap ;sec \section{}<Esc>i
autocmd FileType tex inoremap ;ssec \subsection{}<Esc>i
autocmd FileType tex inoremap ;sssec \subsubsection{}<Esc>i

" Text formatting
autocmd FileType tex inoremap ;b \textbf{}<Esc>i
autocmd FileType tex inoremap ;i \textit{}<Esc>i
autocmd FileType tex inoremap ;u \underline{}<Esc>i
autocmd FileType tex inoremap ;em \emph{}<Esc>i

" Text with specific font
autocmd FileType tex inoremap ;rm \textrm{}<Esc>i
autocmd FileType tex inoremap ;sf \textsf{}<Esc>i
autocmd FileType tex inoremap ;t \texttt{}<Esc>i

" Alignment
autocmd FileType tex inoremap ;cen \begin{center}<Enter>\end{center}<Esc>O
autocmd FileType tex inoremap ;right \begin{flushright}<Enter>\end{flushright}<Esc>O
autocmd FileType tex inoremap ;left \begin{flushleft}<Enter>\end{flushleft}<Esc>O

" Breaks
autocmd FileType tex inoremap ;pb \pagebreak<Enter>
autocmd FileType tex inoremap ;np \newpage<Enter>

" Spacing
autocmd FileType tex inoremap ;sh \hspace{}<Esc>i
autocmd FileType tex inoremap ;sv \vspace{}<Esc>i

" Graphics
autocmd FileType tex inoremap ;img \includegraphics{}<Esc>i
autocmd FileType tex inoremap ;imgo \includegraphics[]{}<Esc>F]i

" Environment
autocmd FileType tex inoremap ;doc \begin{document}<Enter>\end{document}<Esc>O
autocmd FileType tex inoremap ;item \begin{itemize}<Enter>\end{itemize}<Esc>O
autocmd FileType tex inoremap ;enum \begin{enumerate}[]<Enter>\end{enumerate}<Esc>k$i
autocmd FileType tex inoremap ;fr \begin{frame}<Enter>\end{frame}<Esc>O
autocmd FileType tex inoremap ;tb \begin{tabular}{}<Enter>\end{tabular}<Esc>k$i

" }}}t
