local cmd = vim.cmd
local opt = vim.opt
local g = vim.g

---- :help options
opt.backup = false                          -- creates a backup file
opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
opt.fileencoding = "utf-8"                  -- the encoding written to a file
opt.ignorecase = true                       -- ignore case in search patterns
opt.mouse = "a"                             -- allow the mouse to be used in neovim
opt.pumheight = 10                          -- pop up menu height
opt.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
opt.smartcase = true                        -- smart case
opt.smartindent = true                      -- make indenting smarter again
opt.splitbelow = true                       -- force all horizontal splits to go below current window
opt.splitright = true                       -- force all vertical splits to go to the right of current window
opt.swapfile = false                        -- creates a swapfile
opt.termguicolors = true                    -- set term gui colors (most terminals support this)
opt.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)
opt.undofile = true                         -- enable persistent undo
opt.updatetime = 300                        -- faster completion (4000ms default)
opt.expandtab = true                        -- convert tabs to spaces
opt.shiftwidth = 4                          -- the number of spaces inserted for each indentation
opt.tabstop = 4                             -- insert 2 spaces for a tab
opt.number = false                          -- set numbered lines
opt.relativenumber = false                  -- set relative numbered lines
opt.numberwidth = 1                         -- set number column width to 2 {default 4}
opt.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
opt.wrap = false                            -- display lines as one long line
opt.scrolloff = 8                           -- is one of my fav
opt.writebackup = false                     -- when file is edited by some program (or was written to file while editing with some program), it's not allowed to be edited
opt.sidescrolloff = 8                       -- how many lines to scroll when you scroll past the end of the screen
opt.shortmess:append "c"                    -- show the current cursor position
opt.background = "dark"                     -- set the background color
opt.fillchars = { eob = " " }               -- set the fill character for the end of the line
opt.laststatus = 0                          -- set the last status line to 0
opt.hidden = true                           -- hide the status line
opt.whichwrap:append "<>[]hl"               -- set the wrap characters
opt.signcolumn = "yes"                      -- show the sign column
opt.foldmethod = "indent"
opt.foldnestmax = 10
opt.foldenable = false
opt.foldlevel = 2
-- opt.hlsearch = true                         -- highlight all matches on previous search pattern
-- opt.cmdheight = 2                           -- more space in the neovim command line for displaying messages
-- opt.showtabline = 2                         -- always show tabs
-- opt.cursorline = true                       -- highlight the current line
-- opt.conceallevel = 0                        -- so that `` is visible in markdown files
-- opt.guifont = "monospace:h17"               -- the font used in graphical neovim applications

-- vim.cmd "set whichwrap+=<,>,[,],h,l"
cmd [[set iskeyword+=-]]
-- vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
