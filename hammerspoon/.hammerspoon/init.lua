-- requires
local application = require "hs.application"
local window = require "hs.window"
local hotkey = require "hs.hotkey"
local keycodes = require "hs.keycodes"
local fnutils = require "hs.fnutils"
local alert = require "hs.alert"
local notify = require "hs.notify"
local screen = require "hs.screen"
local grid = require "hs.grid"
local hints = require "hs.hints"
hints.style="vimperator"
local appfinder = require "hs.appfinder"
local applescript = require "hs.applescript"
grid.setMargins({0,0})
grid.setGrid'4x3'
-- constants
local smash = {"cmd", "alt" }
local hulk_smash = {"ctrl", "cmd", "alt"}
local monitor = "LCD"
local second_monitor = "extended LCD"

-- hotkeys
hotkey.bind(smash, "h", grid.pushWindowLeft)
hotkey.bind(smash, "l", grid.pushWindowRight)
hotkey.bind(smash, "j", grid.pushWindowDown)
hotkey.bind(smash, "k", grid.pushWindowUp)
hotkey.bind(smash, "t", grid.resizeWindowThinner)
hotkey.bind(smash, "w", grid.resizeWindowWider)
hotkey.bind(hulk_smash, "i", grid.resizeWindowTaller)
hotkey.bind(smash, "m", grid.resizeWindowShorter)
hotkey.bind(hulk_smash, "f", grid.maximizeWindow)
hotkey.bind({"cmd"}, "e", hs.hints.windowHints)
hotkey.bind(hulk_smash, "g", grid.toggleShow)
hotkey.bind(hulk_smash, "R", hs.reload)
alert.show("Config loaded")

