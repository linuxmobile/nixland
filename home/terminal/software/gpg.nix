{config, ...}: {
  programs.gpg = {
    enable = true;
    enableZshIntegration = true;
    homedir = "${config.xdg.dataHome}/gnupg";
    settings = {
      use-agent = true;
      default-key = "6C50C8D5F2378B63";
    };
  };
}
