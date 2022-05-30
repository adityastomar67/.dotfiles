local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)

  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "psliwka/vim-smoothie" -- For smooth scrolling
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  
  -- Colorschemes
  use "rebelot/kanagawa.nvim"
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  
  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
  
  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "p00f/nvim-ts-rainbow"
  use "nvim-treesitter/playground"

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use 'nvim-telescope/telescope-media-files.nvim'

  -- Git stuff
  use "kdheepak/lazygit.nvim"
  use "lewis6991/gitsigns.nvim"

  use "akinsho/toggleterm.nvim"
  -- use "numToStr/Comment.nvim" -- Easily comment stuff

  -- Copilot
  use {
    "zbirenbaum/copilot.lua",
    event = {"VimEnter"},
    config = function()
      vim.defer_fn(function()
        require("copilot").setup()
      end, 100)
    end,
  }
  use {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua", "nvim-cmp" },
  }
  -- use "github/copilot.vim"

  -- Dashboard
  use {
    "goolord/alpha-nvim",
    requires = {"kyazdani42/nvim-web-devicons"},
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")
        math.randomseed(os.time())
        local function pick_color()
            local colors = {"String", "Identifier", "Keyword", "Number"}
            return colors[math.random(#colors)]
        end
        local function footer()
            local total_plugins = #vim.tbl_keys(packer_plugins)
            local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
            local version = vim.version()
            local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch
            return datetime .. "   " .. total_plugins .. " plugins" .. nvim_version_info
        end
        local logo = {
"                                      ",                                                              
"                                      ",                                                  
"                                      ",                                                  
"                                      ",                                                  
"                                      ",                                                  
"                                      ",                                                  
"              ███████████             ",                          
"            ████▒▒▒▒▒▒▒████          ",                              
"          ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██          ",                              
"        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██      ",                              
"      ██▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒    ██     ",                              
"      ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▒▒▓▓▒▒██    ",                              
"      ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▒▒▓▓▒▒██    ",                              
"    ██▒▒▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒    ▒▒██    ",                              
"    ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██    ",                              
"    ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██    ",                              
"    ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██    ",                              
"    ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██    ",                              
"    ██▒▒██▒▒▒▒▒▒██▒▒▒▒▒▒▒▒██▒▒▒▒▒▒██    ",                              
"    ████  ██▒▒██  ██▒▒▒▒██  ██▒▒██    ",                              
"    ██      ██      ████      ████    ",                              
"                                      ",                              
"                                      ",                              
"                                      ",                              
"                                      ",                              
"                                      ",                              
"                                      ",                              
"                                      "                              
        }
        dashboard.section.header.val = logo
        dashboard.section.header.opts.hl = pick_color()
        dashboard.section.buttons.val = {
            dashboard.button("Ctrl+E", "  File Explorer"),
            dashboard.button("<LDR>fo", "  Find File"),
            dashboard.button("<LDR>lg", "  Git Terminal"),
            dashboard.button("<LDR>ps", "  Update plugins"),
            dashboard.button("Q", "  Quit", ":q!<CR>")
        }
        dashboard.section.footer.val = footer()
        dashboard.section.footer.opts.hl = "Constant"
        alpha.setup(dashboard.opts)
        vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])
    end
}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)