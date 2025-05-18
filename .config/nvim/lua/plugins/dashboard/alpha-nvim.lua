local date = require("plugins.dashboard.scripts.date")
local custom = require("plugins.dashboard.scripts.overwrite")
local senko = require("plugins.dashboard.scripts.senko")

local cmd = function(req, action)
  return ":lua " .. "require('" .. req .. "')." .. action .. "<CR>"
end

-- telescope functions
local find_config_files = cmd("telescope.builtin", "find_files({ cwd = vim.fn.stdpath('config') })")
local recent_files = cmd("telescope", "extensions.recent_files.pick()")
local find_files = cmd("telescope.builtin", "find_files()")
local live_grep = cmd("telescope.builtin", "live_grep()")

return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Header section
    dashboard.section.header.val = senko.head
    dashboard.section.header.opts = {
      hl = senko.color_map,
      position = "center",
    }

    -- Time section
    dashboard.section.time = {
      type = "text",
      val = date.header,
      opts = {
        position = "center",
        hl = date.color_map,
      },
    }

    -- https://www.nerdfonts.com/cheat-sheet
    -- Buttons section
    dashboard.section.buttons.val = {
      custom.button("e", " > New file", ":ene <BAR> startinsert <CR>"),
      custom.button("r", " > Recent files", recent_files),
      custom.button("ff", "󰈞 > Find file", find_files),
      custom.button("fg", "󰭸 > Find word", live_grep),
      custom.button("c", "󰒓 > Config", find_config_files),
      custom.button("l", "󰒲 > Lazy", ":Lazy<CR>"),
      custom.button("u", " > Update", ":Lazy update<CR>"),
      custom.button("q", "󰈆 > Quit NVIM", ":qa<CR>"),
    }

    -- Footer section
    local lazy = require("lazy").stats()
    dashboard.section.footer.val = {
      "Total Plugins: " .. lazy.count,
    }

    -- Layout section
    local function pad(n)
      return { type = "padding", val = n }
    end

    dashboard.config.layout = {
      pad(1),
      dashboard.section.header,
      pad(2),
      dashboard.section.time,
      pad(2),
      dashboard.section.buttons,
      pad(1),
      dashboard.section.footer,
    }

    alpha.setup(dashboard.config)
  end,
}
