-- vim
-- vim.keymap.set("n", "<C-KpPlus>", ":call AdjustFontSize(1)<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-KpMinus>", ":call AdjustFontSize(-1)<CR>", { noremap = true, silent = true })

local map = vim.keymap.set
local map_api = vim.api.nvim_set_keymap

-- neotree
map_api(
  "n",
  "<leader>n",
  ":lua require('neo-tree.command').execute({ toggle = true, dir = vim.fn.expand('%:p:h') })<CR>",
  { noremap = true, silent = true }
)

-- whichkey
map("n", "<leader><CR>", ":WhichKey<CR>")

-- telescope
local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, { desc = "telescope find files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "telescope live grep" })
map("n", "<leader>fb", builtin.buffers, { desc = "telescope find buffers" })
map("n", "<leader>fh", builtin.help_tags, { desc = "telescope help page" })
map_api(
  "n",
  "<leader>fm",
  ":Telescope media_files<CR>",
  { noremap = true, silent = true, desc = "telescope media files" }
)
map_api(
  "n",
  "<Leader><Leader>",
  [[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]],
  { noremap = true, silent = true, desc = "telescope recent files" }
)
-- multicursor
-- in the plugins/utility/multicursor.lua because it would be too much headache

-- LSP
map("n", "K", vim.lsp.buf.hover)
map("n", "gd", vim.lsp.buf.definition)
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "code action" })
map("n", "<leader>gf", vim.lsp.buf.format, { desc = "format buffer" })

-- CMP
-- in the plugins/lsp/cmp.lua because no idea if it's possible to move it :(

-- DAP
local dap = require("dap")
local dap_widgets = require("dap.ui.widgets")

map("n", "<F5>", dap.continue, { desc = "DAP continue" })
map("n", "<F10>", dap.step_over, { desc = "DAP step over" })
map("n", "<F11>", dap.step_into, { desc = "DAP step into" })
map("n", "<F12>", dap.step_out, { desc = "DAP step out" })
map("n", "<Leader>b", dap.toggle_breakpoint, { desc = "DAP toggle breakpoint" })
map("n", "<Leader>dr", dap.repl.open, { desc = "DAP open REPL" })
map("n", "<Leader>dl", dap.run_last, { desc = "DAP run last" })
map({ "n", "v" }, "<Leader>dh", dap_widgets.hover, { desc = "DAP hover" })
map({ "n", "v" }, "<Leader>dp", dap_widgets.preview, { desc = "DAP preview" })

map("n", "<Leader>df", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.frames)
end, { desc = "DAP show frames" })

map("n", "<Leader>ds", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.scopes)
end, { desc = "DAP show scopes" })

map("n", "<leader>da", function()
  require("dap").set_exception_breakpoints({ "Warning", "Error", "Exception" })
end, { desc = "DAP stop on exceptions" })

-- menu
---- Keyboard users
map("n", "<C-t>", function()
  require("menu").open("default")
end, { desc = "Open default menu" })

---- Mouse users + NvimTree users
map("n", "<RightMouse>", function()
  vim.cmd.exec('"normal! \\<RightMouse>"')

  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, { desc = "Open context menu (RightMouse)" })

-- renamer
map_api(
  "i",
  "<F2>",
  '<cmd>lua require("renamer").rename()<cr>',
  { noremap = true, silent = true, desc = "Rename in insert mode" }
)
map_api(
  "n",
  "<leader>rn",
  '<cmd>lua require("renamer").rename()<cr>',
  { noremap = true, silent = true, desc = "Rename in normal mode" }
)
map_api(
  "v",
  "<leader>rn",
  '<cmd>lua require("renamer").rename()<cr>',
  { noremap = true, silent = true, desc = "Rename in visual mode" }
)

-- toggle
vim.keymap.set("n", "<leader>t", "<cmd>lua require('alternate-toggler').toggleAlternate()<CR>")

-- multicursor
local mc = require("multicursor-nvim")
---- Add cursors above/below the main cursor.
vim.keymap.set({ "n", "v" }, "<S-Up>", function()
  mc.addCursor("k")
end, { desc = "Add cursor above" })

vim.keymap.set({ "n", "v" }, "<S-Down>", function()
  mc.addCursor("j")
end, { desc = "Add cursor below" })

---- Rotate the main cursor.
vim.keymap.set({ "n", "v" }, "<S-Left>", function()
  mc.nextCursor()
end, { desc = "Rotate to next cursor" })

vim.keymap.set({ "n", "v" }, "<S-Right>", function()
  mc.prevCursor()
end, { desc = "Rotate to previous cursor" })

---- Add and remove cursors with control + left click.
vim.keymap.set("n", "<c-leftmouse>", mc.handleMouse, { desc = "Add/remove cursor with left click" })

vim.keymap.set({ "n", "v" }, "<c-q>", function()
  if mc.cursorsEnabled() then
    mc.disableCursors()
  else
    mc.addCursor()
  end
end, { desc = "Toggle multi-cursor" })

vim.keymap.set("n", "<esc>", function()
  if not mc.cursorsEnabled() then
    mc.enableCursors()
  elseif mc.hasCursors() then
    mc.clearCursors()
  else
  end
end, { desc = "Enable or clear cursors" })

---- Match new cursors within visual selections by regex.
vim.keymap.set("v", "M", mc.matchCursors, { desc = "Match cursors by regex" })
