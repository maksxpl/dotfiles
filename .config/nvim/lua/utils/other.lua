local M = {}

local lazy = require("lazy")

function M.get_plugin_count()
  return lazy.plugins.get_plugin_count()
end

return M
