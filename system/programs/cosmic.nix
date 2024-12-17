{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nixos-cosmic.nixosModules.default ./scripts/start-cosmic-ext.nix
  ];

  environment = {
    variables.NIXOS_OZONE_WL = "1";
    sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;

    cosmic.excludePackages = with pkgs; [
      # adwaita-icon-theme
      cosmic-edit
      # cosmic-files
      # cosmic-launcher
      # cosmic-term
      # hicolor-icon-theme
      # pop-icon-theme
      # pop-launcher

      cosmic-bg
      cosmic-store
      cosmic-wallpapers
      cosmic-screenshot
      # xdg-desktop-portal-cosmic
    ];
  };

  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;
}
