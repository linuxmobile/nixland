{pkgs, ...}: {

  home.packages = with pkgs; [
    discord-canary
  ];

  # home.file.".config/discordcanary/settings.json".text = builtins.toJSON {
  #   IS_MAXIMIZED = true;
  #   IS_MINIMIZED = false;
  #   SKIP_HOST_UPDATE = true;
  # };
}
