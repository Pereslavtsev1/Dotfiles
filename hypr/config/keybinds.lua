local mainMod = _G.mainMod or "ALT"
local terminal = _G.terminal or "kitty"

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
-- hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
-- hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Move focus (Vim keys)
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "d" }))

-- Move windows (Vim keys)
hl.bind("SUPER + L", hl.dsp.window.move({ direction = "r" }))
hl.bind("SUPER + H", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + K", hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER + J", hl.dsp.window.move({ direction = "d" }))

hl.bind("ALT + F4", hl.dsp.window.close())
hl.bind(mainMod .. " + C", hl.dsp.window.close())

-- Hardware / Media Keys
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("serpantinum brightness lower"), { locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("serpantinum brightness raise"), { locked = true })

hl.bind("F12", hl.dsp.exec_cmd("serpantinum screenshot"), { locked = true })
hl.bind("SHIFT + F12", hl.dsp.exec_cmd("serpantinum screenshot --edit"), { locked = true })
hl.bind(mainMod .. " + F12", hl.dsp.exec_cmd("serpantinum screenshot --full"), { locked = true })
-- hl.bind(mainMod .. " + SHIFT + F12", hl.dsp.exec_cmd("serpantinum screenshot --full --edit"), { locked = true })

hl.bind("XF86PowerOff", hl.dsp.exec_cmd("serpantinum lock"), { locked = true })
-- hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("serpantinum lock"), { repeating = true, locked = true })
hl.bind("F7", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("Page_Down", hl.dsp.exec_cmd("serpantinum volume lower"), { repeating = true, locked = true })
hl.bind("Page_Up", hl.dsp.exec_cmd("serpantinum volume raise"), { repeating = true, locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("serpantinum volume mic-toggle"), { locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("serpantinum volume mute-toggle"), { locked = true })

-- Apps & Utilities from settings.json
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("nautilus"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("serpantinum reload"))

-- Mapped toggles using serpantinium msg actions from original keybinds.lua matching settings.json keys
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("serpantinum msg toggle clipboard"))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("serpantinum msg toggle launcher"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("serpantinum msg toggle calendar"))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("serpantinum msg toggle music"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("serpantinum msg toggle system"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("serpantinum msg toggle wallpaper"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("serpantinum msg toggle settings"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("serpantinum msg toggle network"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("serpantinum msg toggle volume"))

for i = 1, 10 do
	local ws = tostring(i)
	local key = tostring(i % 10)
	hl.bind(mainMod .. " + " .. key, hl.dsp.exec_cmd("serpantinum msg workspace " .. ws))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.exec_cmd("serpantinum msg workspace " .. ws .. " move"))
end

hl.bind(mainMod .. " + TAB", hl.dsp.exec_cmd("serpantinum msg focus_next_monitor"))
