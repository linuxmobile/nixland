{pkgs, ...}: {
  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    pinentryPackage = pkgs.pinentry-gnome3;
  };
}
