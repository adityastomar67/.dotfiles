-- AutoCommands
    -- nvim_create_augroup      — Create or get an augroup.
    -- nvim_create_autocmd      — Create an autocmd.
    -- nvim_del_augroup_by_id   — Delete an augroup by id.
    -- nvim_del_augroup_by_name — Delete an augroup by name.
    -- nvim_del_autocmd         — Delete an autocmd by id.
    -- nvim_do_autocmd          — Do one autocmd.
    -- nvim_get_autocmds        — Get autocmds that match the requirements.

local api = vim.api
local opt = vim.opt                   -- global
local g   = vim.g                     -- global for let options
local wo  = vim.wo                    -- window local
local bo  = vim.bo                    -- buffer local
local fn  = vim.fn                    -- access vim functions
local cmd = vim.cmd                   -- vim commands
local map = require('core.utils').map -- import map helper

function nvim_create_augroups(definitions)
    for group_name, definition in pairs(definitions) do
        vim.api.nvim_command("augroup " .. group_name)
        vim.api.nvim_command("autocmd!")
        for _, def in ipairs(definition) do
            local command = table.concat(vim.tbl_flatten({ "autocmd", def }), " ")
            vim.api.nvim_command(command)
        end
        vim.api.nvim_command("augroup END")
    end
end

vim.cmd([[autocmd InsertEnter * norm zz]]) -- Vertically center document when entering insert mode
-- cmd([[Command! Realtime set autoread | ]]) -- Automatic update of any Buffer when not in use
vim.cmd([[cnoreab cls Cls]])
vim.cmd([[command! Cls lua require("core.utils").preserve('%s/\\s\\+$//ge')]])
vim.cmd([[command! Reindent lua require('core.utils').preserve("sil keepj normal! gg=G")]])
vim.cmd([[command! BufOnly lua require('core.utils').preserve("silent! %bd|e#|bd#")]])
vim.cmd([[cnoreab Bo BufOnly]])
vim.cmd([[cnoreab W w]])
vim.cmd([[cnoreab W! w!]])
vim.cmd([[command! CloneBuffer new | 0put =getbufline('#',1,'$')]])
vim.cmd([[command! Mappings drop ~/.config/nvim/lua/user/mappings.lua]])
vim.cmd([[command! Scratch new | setlocal bt=nofile bh=wipe nobl noswapfile nu]])
vim.cmd([[syntax sync minlines=64]]) --  faster syntax hl
vim.cmd([[command! Blockwise lua require('core.utils').blockwise_clipboard()]])
vim.cmd([[cnoreab Bw Blockwise]])
vim.cmd([[cmap w!! w !doas tee % >/dev/null]]) -- save as root, in my case I use the command 'doas'
vim.cmd([[command! SaveAsRoot w !doas tee %]])
vim.cmd('command! ReloadConfig lua require("utils").ReloadConfig()')
vim.cmd([[inoreab Fname <c-r>=expand("%:p")<cr>]])
vim.cmd([[inoreab Iname <c-r>=expand("%:p")<cr>]])
vim.cmd([[inoreab fname <c-r>=expand("%:t")<cr>]])
vim.cmd([[inoreab iname <c-r>=expand("%:t")<cr>]])
vim.cmd([[inoreabbrev idate <C-R>=strftime("%b %d %Y %H:%M")<CR>]])
vim.cmd([[cnoreab cls Cls]])
-- vim.cmd("hi normal guibg=NONE ctermbg=NONE")
-- vim.cmd([[command! -bar -nargs=1 Grep silent grep <q-args> | redraw! | cw]])
-- vim.cmd([[hi ActiveWindow ctermbg=16 | hi InactiveWindow ctermbg=233]])
-- vim.cmd([[set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow]])

-- Give me some fenced codeblock goodness
vim.g.markdown_fenced_languages = {
	"html",
	"javascript",
	"javascriptreact",
	"typescript",
	"json",
	"css",
	"scss",
	"lua",
	"vim",
	"bash",
	"ts=typescript",
}

-- Highlight on yank
local yankGrp = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
	command = "silent! lua vim.highlight.on_yank()",
	group = yankGrp,
})

-- go to last loc when opening a buffer
api.nvim_create_autocmd(
	"BufReadPost",
	{ command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]] }
)

-- windows to close with "q"
api.nvim_create_autocmd(
	"FileType",
	{ pattern = { "help", "startuptime", "qf", "lspinfo" }, command = [[nnoremap <buffer><silent> q :close<CR>]] }
)
api.nvim_create_autocmd("FileType", { pattern = "man", command = [[nnoremap <buffer><silent> q :quit<CR>]] })

-- show cursor line only in active window
-- local cursorGrp = api.nvim_create_augroup("CursorLine", { clear = true })
-- api.nvim_create_autocmd(
--   { "InsertLeave", "WinEnter" },
--   { pattern = "*", command = "set cursorline", group = cursorGrp }
-- )
-- api.nvim_create_autocmd(
--   { "InsertEnter", "WinLeave" },
--   { pattern = "*", command = "set nocursorline", group = cursorGrp }
-- )

local function code_keymap()
	if vim.fn.has("nvim-0.7") then
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "*",
			callback = function()
				vim.schedule(CodeRunner)
			end,
		})
	else
		vim.cmd("autocmd FileType * lua CodeRunner()")
	end

	function CodeRunner()
		local bufnr = vim.api.nvim_get_current_buf()
		local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")
		local fname = vim.fn.expand("%:p:t")
		local keymap_c = {}

		if ft == "python" then
			keymap_c = {
				name = "Code",
				r = { "<cmd>update<CR><cmd>exec '!python3' shellescape(@%, 1)<cr>", "Run" },
				m = { "<cmd>TermExec cmd='nodemon -e py %'<cr>", "Monitor" },
			}
		elseif ft == "lua" then
			keymap_c = {
				name = "Code",
				r = { "<cmd>luafile %<cr>", "Run" },
			}
		elseif ft == "rust" then
			keymap_c = {
				name = "Code",
				r = { "<cmd>Cargo run<cr>", "Run" },
				D = { "<cmd>RustDebuggables<cr>", "Debuggables" },
				h = { "<cmd>RustHoverActions<cr>", "Hover Actions" },
				R = { "<cmd>RustRunnables<cr>", "Runnables" },
			}
		elseif ft == "go" then
			keymap_c = {
				name = "Code",
				r = { "<cmd>GoRun<cr>", "Run" },
			}
		elseif ft == "typescript" or ft == "typescriptreact" or ft == "javascript" or ft == "javascriptreact" then
			keymap_c = {
				name = "Code",
				o = { "<cmd>TSLspOrganize<cr>", "Organize" },
				r = { "<cmd>TSLspRenameFile<cr>", "Rename File" },
				i = { "<cmd>TSLspImportAll<cr>", "Import All" },
				R = { "<cmd>lua require('config.test').javascript_runner()<cr>", "Choose Test Runner" },
				s = { "<cmd>2TermExec cmd='yarn start'<cr>", "Yarn Start" },
				t = { "<cmd>2TermExec cmd='yarn test'<cr>", "Yarn Test" },
			}
		end

		if fname == "package.json" then
			keymap_c.v = { "<cmd>lua require('package-info').show()<cr>", "Show Version" }
			keymap_c.c = { "<cmd>lua require('package-info').change_version()<cr>", "Change Version" }
			keymap_c.s = { "<cmd>2TermExec cmd='yarn start'<cr>", "Yarn Start" }
			keymap_c.t = { "<cmd>2TermExec cmd='yarn test'<cr>", "Yarn Test" }
		end

		-- if next(keymap_c) ~= nil then
		-- 	whichkey.register(
		-- 		{ c = keymap_c },
		-- 		{ mode = "n", silent = true, noremap = true, buffer = bufnr, prefix = "<leader>" }
		-- 	)
		-- end
	end
end

local autocmds = {
    -- autoskel = {
        -- {"BufNewFile", "*.lua,*.sh", 'lua vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("i_skel<CR>",true,false,true),"m",true)' },
    -- },
    reload_vimrc = {
        -- Reload vim config automatically
        -- {"BufWritePost",[[$VIM_PATH/{*.vim,*.yaml,vimrc} nested source $MYVIMRC | redraw]]};
        { "BufWritePre", "$MYVIMRC", "lua require('core.utils').ReloadConfig()" },
    },
    general_settings = {
        { "Filetype", "qf,help,man,lspinfo", ":nnoremap <silent> <buffer> q :close<CR>" },
        { "Filetype", "qf", ":set nobuflisted" },
    },
    -- https://www.reddit.com/r/vim/comments/4aab93/comment/d0yo622/
    -- https://freshman.tech/vim-quickfix-and-location-list/
    autoquickfix = {
        { "QuickFixCmdPost", "[^l]*", "cwindow" },
        { "QuickFixCmdPost", "l*", "lwindow" },
    },
    -- wrap_spell = {
    --     { "FileType", "markdown", ":setlocal wrap" },
    --     { "FileType", "markdown", ":setlocal spell" },
    -- },
    fix_commentstring = {
        { "Bufenter", "*config,*rc,*conf", "set commentstring=#%s" },
        { "Bufenter", "*config,*conf,sxhkdrc,bspwmrc", "set syntax=config" },
    },
    reload_sxhkd_bindings = {
        -- {'BufWritePost', '*sxhkdrc', '!pkill -USR1 sxhkd && setsid sxhkd &'},
        {'BufWritePost', '*sxhkdrc', '!pkill -USR1 -x sxhkd'},
        -- {'BufWritePost', '*bspwmrc', '!bspc wm -r; dunstify "bspwm restarted!"'},
    },
    make_scripts_executable = {
        {'BufWritePost', '*.sh,*.py,*.zsh', [[!chmod +x %]]},
    },
    custom_updates = {
        {'BufWritePost', '~/.Xresources', '!xrdb -merge ~/.Xresources'},
        {'BufWritePost', '~/.Xdefaults', '!xrdb -merge ~/.Xdefaults'},
        {'BufWritePost', 'fonts.conf', '!fc-cache'},
    },
	-- https://stackoverflow.com/a/23326474/2571881
	format_options = { -- :h fo-talbe (for help)
		{ "BufWinEnter,BufRead,BufNewFile", "*", "setlocal formatoptions-=r formatoptions-=o" },
	},
    change_header = {
        -- { "BufWinLeave", "*", "lua require('core.utils').changeheader()" },
    },
    resize_windows_proportionally = {
        { "VimResized", "*", ":wincmd =" };
		{ "Filetype", "help", ":wincmd =" };
    };
    packer = {
		{ "BufWritePost", "plugins.lua", "source <afile> | PackerSync" },
    },
    terminal_job = {
        { "TermOpen", "*", [[tnoremap <buffer> <Esc> <c-\><c-n>]] },
        { "TermOpen", "*", [[tnoremap <buffer> <leader>x <c-\><c-n>:bd!<cr>]] },
        { "TermOpen", "*", [[tnoremap <expr> <A-r> '<c-\><c-n>"'.nr2char(getchar()).'pi' ]] },
        { "TermOpen", "*", "startinsert" },
        { "TermOpen", "*", [[nnoremap <buffer> <C-c> i<C-c>]] },
        { "TermOpen", "*", "setlocal listchars= nonumber norelativenumber" },
        { "TermOpen", "*", [[lua vim.opt_local.buflisted = false]] },
    },
    restore_cursor = {
        { "BufRead", "*", [[call setpos(".", getpos("'\""))]] },
    },

    -- https://vi.stackexchange.com/a/25687/7339
    -- hicurrent_word = {
    --     { "CursorHold", "*", [[:exec 'match Search /\V\<' . expand('<cword>') . '\>/']] },
    -- },
    save_shada = {
        { "VimLeave", "*", "wshada!"};
        { "CursorHold", "*", [[rshada|wshada]]};
    };
    -- auto_exit_insertmode = {
    --     { "CursorHoldI", "*", "stopinsert" },
    -- },
    wins = {
        -- { "VimResized", "*", ":wincmd =" },
        -- { "WinEnter", "*", "wincmd =" },
        { "BufEnter", "NvimTree", [[setlocal cursorline]] },
    },
    -- show trailing spaces only in normal mode and activastes cursorline
    toggle_search_highlighting = {
        { "InsertEnter,InsertLeave", "*", [[set cul!]]},
        { "InsertEnter", "*", "setlocal nohlsearch" },
        { "InsertEnter", "*", [[call clearmatches()]]},
        { "InsertLeave", "*", [[highlight RedundantSpaces ctermbg=red guibg=red]]},
        { "InsertLeave", "*", [[match RedundantSpaces /\s\+$/]]},
    },
    lua_highlight = {
        { "TextYankPost", "*", [[silent! lua vim.highlight.on_yank() {higroup="IncSearch", timeout=600}]] },
    },
    auto_working_directory = {
        { "BufEnter", "*", "silent! lcd %:p:h" },
    },
    clean_trailing_spaces = {
        { "BufWritePre", "*", [[lua require("core.utils").preserve('%s/\\s\\+$//ge')]] },
    },
    -- ansi_esc_log = {
    --     { "BufEnter", "*.log", ":AnsiEsc" };
    -- };

    -- https://stackoverflow.com/a/18427760/2571881
    -- https://vimhelp.org/usr_11.txt.html
    -- https://ttm.github.io/research/2017/11/02/vim-swp-swo.html
    -- AutoRecoverSwapFile = {
    --     { "SwapExists", "*", [[let v:swapchoice = 'r' | let b:swapname = v:swapname]] },
    --     { "BufWinEnter", "*", [[if exists("b:swapname") | call delete(b:swapname) | endif]] },
    -- },
    -- flash cursorline and change cursor shape:
    -- flash_cursor_line = {
    --     { "WinEnter", "*", "lua require('core.utils').flash_cursorline()" },
    --     -- { "WinEnter", "*", "Beacon" },
    --     -- https://stackoverflow.com/a/42118416/2571881  - https://st.suckless.org/patches/blinking_cursor/
    --     { "VimLeave", "*", "lua vim.opt.guicursor='a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,n-v:hor20'"},
    -- },
    -- attatch_colorizer = {
    -- 	-- {BufReadPost *.conf setl ft=conf};
    -- 	{"BufReadPost", "config", "setl ft=conf"};
    -- 	{"FileType", "conf", "ColorizerAttachToBuffer<CR>"};
    -- };
}

nvim_create_augroups(autocmds)
-- autocommands END

local augroups = {}

augroups.buf_write_pre = {

    mkdir_before_saving = {
        event = {"BufWritePre", "FileWritePre"},
        pattern = "*",
        -- TODO: Replace vimscript function
        command = [[ silent! call mkdir(expand("<afile>:p:h"), "p") ]],
    },

    trim_extra_spaces_and_newlines = {
        event = "BufWritePre",
        pattern = "*",
        -- TODO: Replace vimscript function
        command = require("core.utils").preserve('%s/\\s\\+$//ge'),
    },

}

augroups.misc = {
	highlight_yank = {
		event = "TextYankPost",
		pattern = "*",
		callback = function ()
			vim.highlight.on_yank{higroup="IncSearch", timeout=400, on_visual=true}
		end,
	},
	-- trigger_nvim_lint = {
	-- 	event = {"BufEnter", "BufNew", "InsertLeave", "TextChanged"},
	-- 	pattern = "<buffer>",
	-- 	callback = function ()
	-- 		require("lint").try_lint()
	-- 	end,
	-- },
	unlist_terminal = {
		event = "TermOpen",
		pattern = "*",
		callback = function ()
			vim.opt_local.buflisted = false
            vim.opt.listchars=''
            vim.cmd('startinsert')
		end
	},
}

-- TODO: To create a function that Updates a file in Realtime
    -- NOTE: :set autoread | au CursorHold * checktime | call feedkeys("lh")