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

-- config.initial_cols = 120
-- config.initial_rows = 28

-- config.color_scheme = 'OneDark (Gogh)'
config.color_scheme = 'OneDark (base16)'

config.font = wezterm.font 'Hack Nerd font'
config.font_size = 12.0

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  config.default_prog = { 'powershell.exe' }
end

if wezterm.target_triple == 'aarch64-apple-darwin' then
  -- config.window_decorations = "NONE | MACOS_FORCE_DISABLE_SHADOW"
end

-- and finally, return the configuration to wezterm
return config

