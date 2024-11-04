-- vim
-- vim.keymap.set("n", "<C-KpPlus>", ":call AdjustFontSize(1)<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-KpMinus>", ":call AdjustFontSize(-1)<CR>", { noremap = true, silent = true })

-- neotree
vim.api.nvim_set_keymap(
  "n",
  "<leader>n",
  ":lua require('neo-tree.command').execute({ toggle = true, dir = vim.fn.expand('%:p:h') })<CR>",
  { noremap = true, silent = true }
)

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files)
vim.keymap.set("n", "<leader>fg", builtin.live_grep)
vim.keymap.set("n", "<leader>fb", builtin.buffers)
vim.keymap.set("n", "<leader>fh", builtin.help_tags)
vim.api.nvim_set_keymap("n", "<leader>fm", ":Telescope media_files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
  "n",
  "<Leader><Leader>",
  [[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]],
  { noremap = true, silent = true }
)

-- multicursor
-- in the plugins/utility/multicursor.lua because it would be too much headache

-- LSP
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format)

-- CMP
-- in the plugins/lsp/cmp.lua because no idea if it's possible to move it :(

-- DAP
local dap = require("dap")
local dap_widgets = require("dap.ui.widgets")
vim.keymap.set("n", "<F5>", dap.continue)
vim.keymap.set("n", "<F10>", dap.step_over)
vim.keymap.set("n", "<F11>", dap.step_into)
vim.keymap.set("n", "<F12>", dap.step_out)
vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<Leader>dr", dap.repl.open)
vim.keymap.set("n", "<Leader>dl", dap.run_last)
vim.keymap.set({ "n", "v" }, "<Leader>dh", dap_widgets.hover)
vim.keymap.set({ "n", "v" }, "<Leader>dp", dap_widgets.preview)
vim.keymap.set("n", "<Leader>df", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set("n", "<Leader>ds", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.scopes)
end)
vim.keymap.set("n", "<leader>da", function()
  require("dap").set_exception_breakpoints({ "Warning", "Error", "Exception" })
end, { desc = "Stop on exceptions" })
