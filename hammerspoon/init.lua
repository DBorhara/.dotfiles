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
