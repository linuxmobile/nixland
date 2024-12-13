{
  imports = [
    # editors
    ../../editors/helix
    ../../editors/zed

    # services
    # ../../services/ags
    ../../services/quickshell

    # media services
    ../../services/media/playerctl.nix

    # software
    ../../software
    ../../software/wayland

    
    ../../software/tools/discord.nix

    # system services
    ../../services/system/gpg-agent.nix
    ../../services/system/polkit-agent.nix
    ../../services/system/syncthing.nix

    # terminal emulators
    ../../terminal/emulators/foot.nix
  ];
}
