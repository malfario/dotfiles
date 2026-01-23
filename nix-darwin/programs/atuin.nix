{
  programs.atuin = {
    enable = true;
    enableFishIntegration = true;
    forceOverwriteSettings = true;
    settings = {
      filter_mode_shell_up_key_binding = "directory";
      sync = {
        records = true;
      };
    };
  };
}
