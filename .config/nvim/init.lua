require "core.options"
require "core.keymaps"
require "core.plugins"
require "core.colorscheme"
require "core.cmp"
require "core.lsp"
require "core.telescope"
require "core.treesitter"
require "core.nvim-tree"
require "core.null-ls"
require "core.gitsigns"
require "core.toggleterm"
require "core.lspInstaller"
require "core.dressing"
require "core.cmds"

vim.notify = require("notify")
vim.cmd('source $HOME/.abbreviations.vim')

-- NOTE: Needs to be checked
require("notify").setup({
  background_colour = "#000000",
})

local opts = { noremap = true, silent = true }

vim.keymap.set("n",  "<F10>" , function()
	if vim.o.conceallevel > 0 then
		vim.o.conceallevel = 0
	else
		vim.o.conceallevel = 2
	end
end, opts)

vim.keymap.set("n",  "<F11>" , function()
	if vim.o.concealcursor == "n" then
		vim.o.concealcursor = ""
	else
		vim.o.concealcursor = "n"
	end
end, opts)
