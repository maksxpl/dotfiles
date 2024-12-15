#!/usr/bin/lua
local options = {
    [" Lock"] = "swaylock",
    [" Shut down"] = "systemctl poweroff",
    [" Reboot"] = "systemctl reboot",
    ["󰍃 Log out"] = "hyprctl dispatch exit",
    ["鈴 Suspend"] = "systemctl suspend",
    [" Hibernate"] = "systemctl hibernate",
}

-- Create a table to hold sorted options
local sorted_options = {}

-- Sort options alphabetically by their keys
for key, _ in pairs(options) do
    table.insert(sorted_options, key)
end
table.sort(sorted_options)

-- Create options string
local options_string = ""
local length = 0
for _, key in ipairs(sorted_options) do
    options_string = options_string .. key .. "\n"
    length = length + 1
end
options_string = options_string:sub(1, -2)

-- Run fuzzel with sorted options
local f = assert(
    io.popen(
        "echo -e '"
            .. options_string
            .. "' | fuzzel -b 000000ff -t ffffffff --dmenu --prompt 'Power menu >'",
        "r"
    )
)
local s = assert(f:read("*a"))
s = string.gsub(s, "^%s+", "")
s = string.gsub(s, "%s+$", "")
s = string.gsub(s, "[\n]+", " ")
f:close()

-- Use the selected option
os.execute(options[s])

