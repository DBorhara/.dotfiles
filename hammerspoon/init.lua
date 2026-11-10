---------------------------------------------
--  Drop-down terminal: Cmd-` toggles a kitty panel that slides in from
--  the top. It's a separate kitty instance, so your normal kitty windows
--  are never touched. The first press starts it; later presses
--  show / hide it.
--
--  (Uses `kitty +kitten panel` directly: the standalone
--  `kitten quick-access-terminal` fails on this install with
--  "Unknown flag: --toggle-visibility".)
---------------------------------------------

local PANEL_CMD = table.concat({
    "/Applications/kitty.app/Contents/MacOS/kitty +kitten panel",
    "--single-instance --instance-group dropdown",
    "--toggle-visibility",
    "--edge top",
    "--layer top",                -- float above other windows (default is below)
    "--lines 26",                -- height in lines (~60% of the laptop screen)
    "--focus-policy exclusive",   -- take keyboard focus when shown
    "--hide-on-focus-loss",       -- slide away when you click another app
    "-o background_opacity=0.95",
}, " ")

hs.hotkey.bind({ "cmd" }, "`", function()
    -- Backgrounded through a shell so the panel outlives Hammerspoon reloads.
    -- (kitty's own --detach hits the same --toggle-visibility bug.)
    hs.task.new("/bin/sh", nil, { "-c", PANEL_CMD .. " >/dev/null 2>&1 &" }):start()
end)

---------------------------------------------
--  Window management on ⌃⌥ (Control-Option) + Vim keys
--    h / l    left / right half; press again for ⅓ then ⅔
--    k        maximize            j      center (70%)
--    n        move to next screen Space  window hints (type a letter)
---------------------------------------------

local mod = { "ctrl", "alt" }
local SPEED = 0.08
local fractions = { 1 / 2, 1 / 3, 2 / 3 }
local cycle = {} -- per-window: which side was snapped and how many times

local function snap(side)
    local win = hs.window.focusedWindow()
    if not win then return end
    local id, c = win:id(), cycle[win:id()]
    local i = (c and c.side == side) and (c.i % #fractions) + 1 or 1
    cycle[id] = { side = side, i = i }
    local f = win:screen():frame()
    local w = math.floor(f.w * fractions[i])
    local x = (side == "left") and f.x or (f.x + f.w - w)
    win:setFrame({ x = x, y = f.y, w = w, h = f.h }, SPEED)
end

local function place(fn)
    return function()
        local win = hs.window.focusedWindow()
        if not win then return end
        cycle[win:id()] = nil
        fn(win, win:screen():frame())
    end
end

hs.hotkey.bind(mod, "h", function() snap("left") end)
hs.hotkey.bind(mod, "l", function() snap("right") end)
hs.hotkey.bind(mod, "k", place(function(win, f) win:setFrame(f, SPEED) end))
hs.hotkey.bind(mod, "j", place(function(win, f)
    local w, h = f.w * 0.7, f.h * 0.8
    win:setFrame({ x = f.x + (f.w - w) / 2, y = f.y + (f.h - h) / 2, w = w, h = h }, SPEED)
end))
hs.hotkey.bind(mod, "n", place(function(win)
    win:moveToScreen(win:screen():next(), false, true, SPEED)
end))

-- Window hints: every window gets a letter; type it to jump there.
hs.hints.style = "vimperator"   -- hint letters start with the app's initial
hs.hotkey.bind(mod, "space", function() hs.hints.windowHints() end)

---------------------------------------------
--  Reload automatically when a .lua file here is saved
---------------------------------------------
-- Watch the real folder (~/.hammerspoon is a symlink into dotfiles).
-- Kept in a global so it isn't garbage-collected.
ConfigWatcher = hs.pathwatcher
    .new(hs.fs.pathToAbsolute(hs.configdir), function(files)
        for _, file in ipairs(files) do
            if file:sub(-4) == ".lua" then
                hs.reload()
                return
            end
        end
    end)
    :start()

hs.alert.show("Hammerspoon config loaded")
