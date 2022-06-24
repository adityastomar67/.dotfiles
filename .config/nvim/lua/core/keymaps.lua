local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
keymap("n", "<leader>z", ":set invrnu invnu<CR>", opts)
keymap("n", "<C-o>", ":lua require('telescope.builtin').find_files(require('telescope.themes').get_ivy({ winblend = 90 }))<CR>", opts)
-- keymap("n", "<C-o>", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>lg", ":LazyGit<CR>", opts)
keymap("n", "<leader>pr", ':TermExec cmd="clear && prog %"<CR>', opts)
keymap("n", "<leader>tt", ':TermExec size=30 direction=float cmd="clear"<CR>', opts)
keymap("n", "<leader>th", ':TermExec  direction=horizontal cmd="clear"<CR>', opts)
keymap("n", "<leader>sh", ":!chmod +x % && source %<CR>", opts)
keymap("n", "<leader>sr", ":source ~/.config/nvim/init.lua<CR>", opts)
keymap("n", "<CR>", ":noh<CR><CR>", opts)
keymap("n", "f", ":HopWord<CR>", opts)
keymap("n", "F", ":HopLine<CR>", opts)
keymap("n", "U", "<C-r>", opts)
keymap("n", "<leader>|", "<C-w>v", opts)
keymap("n", "<leader>_", "<C-w>s", opts)

-- Yank all content
keymap("n", "<leader>y", "ggVGy", opts)
keymap("n", "Y", "y$", opts)

-- Writing & exiting
-- keymap("n", "q", ":q<CR>", opts)
keymap("n", "<C-s>", ":w<CR>", opts)
keymap("n", "Q", ":q!<CR>", opts)
keymap("n", "<C-c>", ":bw<CR>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Getting Rid Of Bad Habbits
keymap("n", "<Up>", "<Nop>", opts)
keymap("n", "<Down>", "<Nop>", opts)
keymap("n", "<Left>", "<Nop>", opts)
keymap("n", "<Right>", "<Nop>", opts)

-- keymap("n", "<leader>n", ":Lex 30<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
keymap("i", "<leader>pr", '<ESC>:TermExec cmd="clear && prog %"<CR>', opts)

-- Braces pairing
keymap("i", "<>", "<><Left>", opts)
keymap("i", "{}", "{}<Left>", opts)
keymap("i", "()", "()<Left>", opts)
keymap("i", "[]", "[]<Left>", opts)
keymap("i", '""', '""<Left>', opts)
keymap("i", "''", "''<Left>", opts)
keymap("i", "``", "``<Left>", opts)

keymap("i", "<C-F>", "<ESC>:HopLine<CR>", opts)

-- Press qq fast to enter
keymap("i", "qq", "<ESC>", opts)

keymap("i", "<C-s>", "<ESC>:w<CR>", opts)

-- Better Navigation in insert mode
keymap("i", "<Up>", "<Nop>", opts)
keymap("i", "<Down>", "<Nop>", opts)
keymap("i", "<Left>", "<Nop>", opts)
keymap("i", "<Right>", "<Nop>", opts)

keymap("i", "<C-h>", "<Left>", opts)
keymap("i", "<C-l>", "<Right>", opts)
keymap("i", "<C-j>", "<Down>", opts)
keymap("i", "<C-k>", "<Up>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

keymap("n", "<C-e>", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>ps", ":PackerSync<CR>", opts)
