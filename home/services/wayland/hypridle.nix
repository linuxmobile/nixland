{
  pkgs,
  lib,
  config,
  ...
}: let
  suspendScript = pkgs.writeShellScript "suspend-script" ''
    ${pkgs.pipewire}/bin/pw-cli i all 2>&1 | ${pkgs.ripgrep}/bin/rg running -q
    # only suspend if audio isn't running
    if [ $? == 1 ]; then
      ${pkgs.systemd}/bin/systemctl suspend
    fi
  '';
in {
  # screen idle
  services.hypridle = {
    enable = true;

    settings = {
      beforeSleepCmd = "${pkgs.systemd}/bin/loginctl lock-session";
      lockCmd = lib.getExe config.programs.hyprlock.package;

      listener = [
        {
          timeout = 1200;
          onTimeout = suspendScript.outPath;
        }
      ];
    };
  };
}