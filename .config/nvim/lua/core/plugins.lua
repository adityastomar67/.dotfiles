local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git", "clone", "--depth", "1",
        "https://github.com/wbthomason/packer.nvim", install_path
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then return end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({border = "rounded"})
        end
    }
})

-- Install your plugins here
return packer.startup(function(use)
    use('stevearc/dressing.nvim')
    use("wbthomason/packer.nvim")                               -- Have packer manage itself
    -- use "lunarvim/colorschemes"                                 -- A bunch of colorschemes you can try out
    use("rebelot/kanagawa.nvim")                                -- Colorscheme of choice
    use("nvim-lua/popup.nvim")                                  -- An implementation of the Popup API from vim in Neovim
    use("nvim-lua/plenary.nvim")                                -- Useful lua functions used ny lots of plugins
    use("psliwka/vim-smoothie")                                 -- For smooth scrolling
    use("kyazdani42/nvim-web-devicons")                         -- Icons for webdev
    use("kyazdani42/nvim-tree.lua")                             -- Tree view for files
    use("hrsh7th/nvim-cmp")                                     -- The completion plugin
    use("hrsh7th/cmp-buffer")                                   -- buffer completions
    use("hrsh7th/cmp-path")                                     -- path completions
    use("hrsh7th/cmp-cmdline")                                  -- cmdline completions
    use("saadparwaiz1/cmp_luasnip")                             -- snippet completions
    use("hrsh7th/cmp-nvim-lsp")                                 -- lsp completions
    use("hrsh7th/cmp-nvim-lua")                                 -- lua completions
    use("L3MON4D3/LuaSnip")                                     -- snippet engine
    use("rafamadriz/friendly-snippets")                         -- a bunch of snippets to use
    use("neovim/nvim-lspconfig")                                -- enable LSP
    use("williamboman/nvim-lsp-installer")                      -- simple to use language server installer
    use("jose-elias-alvarez/null-ls.nvim")                      -- for formatters and linters
    use("p00f/nvim-ts-rainbow")                                 -- rainbow colors for syntax highlighting
    use("nvim-treesitter/playground")                           -- playground for treesitter
    use("nvim-telescope/telescope.nvim")                        -- telescope for quick navigation
    use("nvim-telescope/telescope-media-files.nvim")            -- telescope for quick navigation
    use("kdheepak/lazygit.nvim")                                -- lazygit for git
    use("lewis6991/gitsigns.nvim")                              -- gitsigns for git
    use("rcarriga/nvim-notify")                                 -- notify for notifications
    use("akinsho/toggleterm.nvim")                              -- toggleterm for terminal
    use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}) -- treesitter
    use({"zbirenbaum/copilot-cmp", after = {"copilot.lua", "nvim-cmp"}})
    use {
      'phaazon/hop.nvim',
      branch = 'v1', -- optional but strongly recommended
      config = function()
        -- you can configure Hop the way you like here; see :h hop-config
        require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
      end
    }
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use({
        "zbirenbaum/copilot.lua",
        event = {"VimEnter"},
        config = function()
            vim.defer_fn(function() require("copilot").setup() end, 100)
        end
    })
    -- use "github/copilot.vim"

    use({
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
                local nvim_version_info =
                    "   v" .. version.major .. "." .. version.minor .. "." ..
                        version.patch
                return datetime .. "   " .. total_plugins .. " plugins" ..
                           nvim_version_info
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
    })

    use({
        "lewis6991/hover.nvim",
        config = function()
            require("hover").setup({
                init = function()
                    -- Require providers
                    require("hover.providers.lsp")
                    require("hover.providers.gh")
                    -- require('hover.providers.man')
                    -- require('hover.providers.dictionary')
                end,
                preview_opts = {border = nil},
                title = true
            })

            -- Setup keymaps
            vim.keymap.set("n", "K", require("hover").hover,
                           {desc = "hover.nvim"})
            vim.keymap.set("n", "gK", require("hover").hover_select,
                           {desc = "hover.nvim (select)"})
        end
    })

    use({
        "terrortylor/nvim-comment",
        config = function()
            require("nvim_comment").setup({line_mapping = "<leader>gcc"})
        end
    })
    use({
    'norcalli/nvim-colorizer.lua',
    config =function ()
        require("colorizer").setup()
    end
    })
    use {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("todo-comments").setup {
          signs = true, -- show icons in the signs column
          sign_priority = 8, -- sign priority
          keywords = {
            FIX = {
              icon = " ", -- icon used for the sign, and in search results
              color = "#C34043", -- can be a hex color, or a named color (see below)
              alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
              -- signs = false, -- configure signs for some keywords individually
            },
            TODO = { icon = "✖", color = "info" },
            DONE = { icon = " ", color = "done" },
            HACK = { icon = " ", color = "warning" },
            WARN = { icon = " ", color = "error", alt = { "WARNING", "XXX" } },
            PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
            NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
          },
          merge_keywords = true, -- when true, custom keywords will be merged with the defaults
          highlight = {
            before = "", -- "fg" or "bg" or empty
            keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
            after = "fg", -- "fg" or "bg" or empty
            pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
            comments_only = true, -- uses treesitter to match keywords in comments only
            max_line_len = 400, -- ignore lines longer than this
            exclude = {}, -- list of file types to exclude highlighting
          },
          colors = {
            error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
            warning = { "DiagnosticWarning", "WarningMsg", "#FBBF24" },
            info = { "DiagnosticInfo", "#7FB4CA" },
            done = { "DiagnosticDone", "#00A600" },
            hint = { "DiagnosticHint", "#10B981" },
            default = { "Identifier", "#C34043" },
          },
          search = {
            command = "rg",
            args = {
              "--color=never",
              "--no-heading",
              "--with-filename",
              "--line-number",
              "--column",
            },
            pattern = [[\b(KEYWORDS):]], -- ripgrep regex
          },
        }
      end
    }
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then require("packer").sync() end
end)
