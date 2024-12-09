{
  imports = [
    # editors
    ../../editors/helix
    ../../editors/zed

    # software
    ../../software
    # ../../software/wayland
    ../../software/tools/discord.nix

    # system services
    ../../services/system/gpg-agent.nix
    ../../services/system/polkit-agent.nix
    # ../../services/system/power-monitor.nix
    ../../services/system/syncthing.nix
    ../../services/system/auto-theme.nix
  ];
}
