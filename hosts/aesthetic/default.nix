{config, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./profiles/plasma
  ];

  boot = {
    # load modules on boot
    kernelModules = ["amdgpu" "v4l2loopback"];
    extraModulePackages = with config.boot.kernelPackages; [v4l2loopback];
    kernelParams = [
      "amd_pstate=active"
      "ideapad_laptop.allow_v4_dytc=Y"
      "nvme_core.default_ps_max_latency_us=0"
    ];
    extraModprobeConfig = ''
      options v4l2loopback exclusive_caps=1 card_label="OBS Virtual Output"
    '';
  };

  networking.hostName = "aesthetic";

  security.tpm2.enable = true;

  services = {
    # for SSD/NVME
    fstrim.enable = true;
  };
}
