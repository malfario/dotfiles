{
  symlinkJoin,
  makeWrapper,
  ghostty,
}:

symlinkJoin {
  name = "ghostty-wrapped";

  paths = [ ghostty ];

  nativeBuildInputs = [ makeWrapper ];

  postBuild = ''
    wrapProgram $out/bin/ghostty \
      --set GTK_IM_MODULE simple

    desktop="$out/share/applications/com.mitchellh.ghostty.desktop"

    cp --remove-destination "$(readlink -f "$desktop")" "$desktop"

    substituteInPlace "$desktop" \
      --replace-fail \
        "${ghostty}/bin/ghostty" \
        "$out/bin/ghostty"
  '';
}
