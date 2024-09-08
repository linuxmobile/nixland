let
  desktop = [
    ./core/boot.nix
    ./core/default.nix

    ./hardware/opengl.nix
    ./hardware/fwupd.nix

    ./network/default.nix

    ./programs

    ./services
    ./services/greetd.nix
    # ./services/gdm.nix
    ./services/pipewire.nix
  ];

  laptop =
    desktop
    ++ [
      ./hardware/bluetooth.nix
      # ./hardware/xboxdrv.nix

      ./services/backlight.nix
      ./services/power.nix
    ];
in {
  inherit desktop laptop;
}
