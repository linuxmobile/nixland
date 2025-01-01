{
  pkgs,
  lib,
  config,
  ...
}: let
  lock = "${pkgs.systemd}/bin/loginctl lock-session";

  brillo = lib.getExe pkgs.brillo;

  # timeout after which DPMS kicks in
  timeout = 300;
in {
  # screen idle
  services.hypridle = {
    enable = true;

    settings = {
      general.lock_cmd = lib.getExe config.programs.hyprlock.package;

      listener = [
        {
          timeout = timeout - 10;
          # save the current brightness and dim the screen over a period of
          # 500 ms
          on-timeout = "${brillo} -O; ${brillo} -u 500000 -S 10";
          # brighten the screen over a period of 250ms to the saved value
          on-resume = "${brillo} -I -u 250000";
        }
        {
          inherit timeout;
        }
        {
          timeout = timeout + 10;
          on-timeout = lock;
        }
      ];
    };
  };

  systemd.user.services.hypridle.Unit.After = lib.mkForce "graphical-session.target";
}
