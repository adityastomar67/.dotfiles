require "core.options"
require "core.keymaps"
require "core.plugins"
require "core.colorscheme"
require "core.cmp"
require "core.telescope"
require "core.treesitter"
require "core.nvim-tree"
require "core.null-ls"
require "core.gitsigns"
require "core.toggleterm"
require "core.dressing"
require "core.cmds"
require "core.lspInstaller"
require "core.lsp"
-- require "core.files"

vim.notify = require("notify")
vim.cmd('source $HOME/.abbreviations.vim')

-- NOTE: Needs to be checked
require("notify").setup({
  background_colour = "#000000",
})
