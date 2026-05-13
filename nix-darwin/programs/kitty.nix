{
  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    themeFile = "OneDark";
    font = {
      name = "JetBrains Mono";
      size = 14.0;
    };
    settings = {
      macos_option_as_alt = "left";
      macos_show_window_title_in = "none";
      window_margin_width = 8.0;
      window_padding_width = 0.0;
      hide_window_decorations = "titlebar-and-corners";
      macos_quit_when_last_window_closed = true;
      adjust_column_width = -1;
      cursor_trail = 100;
      # text_composition_strategy = "legacy";
    };
    keybindings = {
      "ctrl+shift+w" = "no_op";
    };
  };
}
