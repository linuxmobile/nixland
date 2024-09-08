{pkgs, ...}: {
  hardware.bluetooth = {
    enable = true;
    package = pkgs.bluez5-experimental;
    settings = {
      # make Xbox Series X controller work
      General = {
        Experimental = true;
        FastConnectable = true;
        powerOnBoot = true;
        Class = "0x000100";
        ControllerMode = "bredr";
        JustWorksRepairing = "always";
        Privacy = "device";
      };
    };
  };

  boot.extraModprobeConfig = '' options bluetooth disable_ertm=1 '';
}
