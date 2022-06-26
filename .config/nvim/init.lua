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
vim.cmd('source ~/.abbreviations.vim')
