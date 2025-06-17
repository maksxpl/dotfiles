#!/usr/bin/lua

local options = {
    [" Lock"] = "swaylock",
    [" Shut down"] = "systemctl poweroff",
    [" Reboot"] = "systemctl reboot",
    ["󰍃 Log out"] = "hyprctl dispatch exit",
    ["鈴 Suspend"] = "systemctl suspend",
    [" Hibernate"] = "systemctl hibernate",
}

-- Create a list of keys for Onagre display
local sorted_options = {}
for key in pairs(options) do
    table.insert(sorted_options, key)
end
table.sort(sorted_options)

-- Build Onagre input in the form: label<TAB>id
local onagre_input = {}
for _, key in ipairs(sorted_options) do
    table.insert(onagre_input, string.format("%s\t%s", key, key))
end

-- Join with newlines
local menu_string = table.concat(onagre_input, "\n")

-- Run Onagre in stdin mode and capture selected ID
local f = assert(io.popen("onagre --stdin --stdin-format=label-id --prompt 'Power menu > '", "w"))
f:write(menu_string)
f:close()

-- Read the selected value from Onagre's selection file (if using --stdin)
local selection_file = os.getenv("XDG_RUNTIME_DIR") .. "/onagre-selection"
local selection = io.open(selection_file, "r")
local selected = selection and selection:read("*a"):gsub("%s+", "") or ""
if selection then selection:close() end

-- Run the matched command
if selected and options[selected] then
    os.execute(options[selected])
end
