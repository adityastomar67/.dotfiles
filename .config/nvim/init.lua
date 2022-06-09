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

vim.notify = require("notify")
-- source "~/.filetype.vim"
-- source "~/.abbreviations.vim"

vim.cmd('source ~/.abbreviations.vim')
