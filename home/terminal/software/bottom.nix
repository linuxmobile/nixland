{pkgs, ...}: {
  home.packages = with pkgs; [
    (writeScriptBin "btop" ''exec btm'')
    (writeScriptBin "htop" ''exec btm -b --battery'')
  ];
  programs.bottom = {
    enable = true;
    settings = {
      flags.group_processes = true;
      row = [
        {
          ratio = 2;
          child = [
            {type = "cpu";}
            {type = "mem";}
          ];
        }
        {
          ratio = 3;
          child = [
            {
              type = "proc";
              ratio = 1;
              default = true;
            }
          ];
        }
      ];
    };
  };
}
