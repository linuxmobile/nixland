{
  config,
  lib,
  pkgs,
  ...
}: let
  # wrapper script for `binPath` since the option type is `path`
  niriSession = lib.getExe (
    pkgs.writeShellScriptBin "niriSession" ''
      ${lib.getExe config.programs.niri.package} --session
    ''
  );
in {
  # greetd display manager
  services.greetd = let
    session = {
      command = "${lib.getExe config.programs.uwsm.package} start niri-uwsm.desktop";
      user = "linuxmobile";
    };
  in {
    enable = true;
    settings = {
      terminal.vt = 1;
      default_session = session;
      initial_session = session;
    };
  };

  programs.uwsm = {
    enable = true;
    waylandCompositors.niri = {
      binPath = niriSession;
      prettyName = "Niri";
      comment = "Niri managed by UWSM";
    };
  };

  # unlock GPG keyring on login
  # security.pam.services.greetd.enableGnomeKeyring = true;

  # services.displayManager.autoLogin.enable = true;
  # services.displayManager.autoLogin.user = "linuxmobile";
}
