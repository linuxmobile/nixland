{pkgs, ...}: {
  programs.chromium = {
    enable = true;
    package = pkgs.ungoogled-chromium;
    commandLineArgs = [
      # Chromium Wayland Flags
      "--ignore-gpu-blocklist"
      "--enable-gpu-rasterization"
      "--enable-zero-copy"
      "--disable-features=UseChromeOSDirectVideoDecoder"
      "--ozone-platform=wayland"

      "--enable-media-router"
      "--enable-smooth-scrolling"

      # UnGoogled features
      "--disable-search-engine-collection"
      "--extension-mime-request-handling=always-prompt-for-install"
      "--fingerprinting-canvas-image-data-noise"
      "--fingerprinting-canvas-measuretext-noise"
      "--fingerprinting-client-rects-noise"
      "--popups-to-tabs"
      "--force-punycode-hostnames"
      "--show-avatar-button=incognito-and-guest"

      "--no-default-browser-check"
      "--no-pings"
    ];
    extensions = [
      {id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";} # Ublock Origin
      {id = "jhnleheckmknfcgijgkadoemagpecfol";} # Auto-Tab-Discard
      {id = "nngceckbapebfimnlniiiahkandclblb";} # Bitwarden
    ];
  };
}
