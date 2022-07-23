-- AutoCommands
    -- nvim_create_augroup      — Create or get an augroup.
    -- nvim_create_autocmd      — Create an autocmd.
    -- nvim_del_augroup_by_id   — Delete an augroup by id.
    -- nvim_del_augroup_by_name — Delete an augroup by name.
    -- nvim_del_autocmd         — Delete an autocmd by id.
    -- nvim_do_autocmd          — Do one autocmd.
    -- nvim_get_autocmds        — Get autocmds that match the requirements.

local api = vim.api

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

-- TODO: To create a function that Updates a file in Realtime
    -- NOTE: :set autoread | au CursorHold * checktime | call feedkeys("lh")
