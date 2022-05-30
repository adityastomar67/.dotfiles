local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')
local headers = require('core.shared').ascii_art

local leader = '<LD>'

local function button(sc, txt, leader_txt, keybind, keybind_opts)
  local sc_after = sc:gsub('%s', ''):gsub(leader_txt, '<leader>')

  local opts = {
    position = 'center',
    shortcut = sc,
    cursor = 5,
    width = 50,
    align_shortcut = 'right',
    hl_shortcut = 'Keyword',
  }

  if nil == keybind then
    keybind = sc_after
  end
  keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
  opts.keymap = { 'n', sc_after, keybind, keybind_opts }

  local function on_press()
    -- local key = vim.api.nvim_replace_termcodes(keybind .. '<Ignore>', true, false, true)
    local key = vim.api.nvim_replace_termcodes(sc_after .. '<Ignore>', true, false, true)
    vim.api.nvim_feedkeys(key, 't', false)
  end

  return {
    type = 'button',
    val = txt,
    on_press = on_press,
    opts = opts,
  }
end

math.randomseed(os.time())
dashboard.section.header.val = headers[math.random(1, #headers)]

dashboard.section.buttons.val= {
  button('e', 'ﱐ  New file', leader, '<cmd>ene<CR>'),
  button('s', '  Sync plugins' , leader, '<cmd>PackerSync<CR>'),
  button('c', '  Configurations', leader, '<cmd>e ~/.config/nvim/<CR>'),
  button(leader .. ' f f', '  Find files', leader, '<cmd>Telescope find_files<CR>'),
  button(leader .. ' fof', '  Find old files', leader, '<cmd>Telescope oldfiles<CR>'),
  button(leader .. ' f ;', 'ﭨ  Live grep', leader, '<cmd>Telescope live_grep<CR>'),
  button(leader .. ' f g', '  Git status', leader, '<cmd>Telescope git_status<CR>'),
  button(leader .. '   q', '  Quit' , leader, '<cmd>qa<CR>')
}

-- Foot must be a table so that its height is correctly measured
local num_plugins_loaded = #vim.fn.globpath(vim.fn.stdpath('data') .. '/site/pack/packer/start', '*', 0, 1)
local num_plugins_tot = #vim.tbl_keys(packer_plugins)
if num_plugins_tot <= 1 then
  dashboard.section.footer.val = { num_plugins_loaded .. ' / ' .. num_plugins_tot .. ' plugin ﮣ loaded' }
else
  dashboard.section.footer.val = { num_plugins_loaded .. ' / ' .. num_plugins_tot.. ' plugins ﮣ loaded' }
end
dashboard.section.footer.opts.hl = 'Comment'


-- ┌──────────────────────────────────────────────────────────┐
-- │                  /                                       │
-- │    header_padding                                        │
-- │                  \  ┌──────────────┐ ____                │
-- │                     │    header    │     \               │
-- │                  /  └──────────────┘      \              │
-- │ head_butt_padding                          \             │
-- │                  \                          occu_        │
-- │                  ┌────────────────────┐     height       │
-- │                  │       button       │    /             │
-- │                  │       button       │   /              │
-- │                  │       button       │  /               │
-- │                  └────────────────────┘‾‾                │
-- │                  /                                       │
-- │ foot_butt_padding                                        │
-- │                  \  ┌──────────────┐                     │
-- │                     │    footer    │                     │
-- │                     └──────────────┘                     │
-- │                                                          │
-- └──────────────────────────────────────────────────────────┘

local head_butt_padding = 4
local occu_height = #dashboard.section.header.val + 2 * #dashboard.section.buttons.val + head_butt_padding
local header_padding = math.max(0, math.ceil((vim.fn.winheight('$') - occu_height) * 0.25))
local foot_butt_padding_ub = vim.o.lines - header_padding - occu_height - #dashboard.section.footer.val - 3
local foot_butt_padding = math.floor((vim.fn.winheight('$') - 2 * header_padding - occu_height))
foot_butt_padding = math.max(0, math.max(math.min(0, foot_butt_padding), math.min(math.max(0, foot_butt_padding), foot_butt_padding_ub)))

dashboard.config.layout = {
  { type = 'padding', val = header_padding },
  dashboard.section.header,
  { type = 'padding', val = head_butt_padding },
  dashboard.section.buttons,
  { type = 'padding', val = foot_butt_padding },
  dashboard.section.footer
}

alpha.setup(dashboard.opts)