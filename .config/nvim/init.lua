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
-- require "core.files"

vim.notify = require("notify")
vim.cmd('source $HOME/.abbreviations.vim')

-- NOTE: Needs to be checked
require("notify").setup({
  background_colour = "#000000",
})

-- TODO: Need to move it to LSP config file
require'lspconfig'.eslint.setup{}
require'lspconfig'.emmet_ls.setup{}
require'lspconfig'.jsonls.setup{}
