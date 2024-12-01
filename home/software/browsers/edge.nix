{pkgs, ...}:
# Reference:
# https://wiki.archlinux.org/title/chromium
# https://fcitx-im.org/wiki/Using_Fcitx_5_on_Wayland
# NOTES:
# For fcitx5, we also need to disable "fractional scale under Wayland" to force it to run on Wayland natively.
{
  home.packages = with pkgs; [
    (microsoft-edge.override {
      commandLineArgs = [
        # Force GPU accleration
        "--ignore-gpu-blocklist"
        "--enable-zero-copy"
        # "--enable-unsafe-webgpu"

        # Force to run on Wayland
        "--ozone-platform-hint=auto"
        "--ozone-platform=wayland"
        "--enable-wayland-ime"

        # Reduce memory usage
        "--process-per-site"

        # Force darkmode
        # "--force-dark-mode"

        # Enable additional features
        "--enable-features=WebUIDarkMode,UseOzonePlatform,VaapiVideoDecodeLinuxGL,VaapiVideoDecoder,WebRTCPipeWireCapturer,WaylandWindowDecorations"
      ];
    })
  ];
}
