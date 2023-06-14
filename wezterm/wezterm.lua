-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

config.color_scheme = 'OneDark (base16)'
config.font = wezterm.font 'Hack NFM'
config.font_size = 9.0

config.default_prog = { 'powershell.exe' }

-- and finally, return the configuration to wezterm
return config

