{...}: let
  mkMatchRule = {
    appId,
    title ? "",
    openFloating ? false,
  }: let
    baseRule = {
      matches = [
        {
          app-id = appId;
          inherit title;
        }
      ];
    };
    floatingRule =
      if openFloating
      then {open-floating = true;}
      else {};
  in
    baseRule // floatingRule;

  openFloatingAppIds = [
    "^(pwvucontrol)"
    "^(Volume Control)"
    "^(dialog)"
    "^(file_progress)"
    "^(confirm)"
    "^(download)"
    "^(error)"
    "^(notification)"
  ];

  floatingRules = builtins.map (appId:
    mkMatchRule {
      appId = appId;
      openFloating = true;
    })
  openFloatingAppIds;

  windowRules = [
    {
      geometry-corner-radius = let
        radius = 16.0;
      in {
        bottom-left = radius;
        bottom-right = radius;
        top-left = radius;
        top-right = radius;
      };
      clip-to-geometry = true;
      draw-border-with-background = false;
    }
    {
      matches = [{app-id = "org.telegram.desktop";}];
      block-out-from = "screencast";
    }
    {
      matches = [{app-id = "app.drey.PaperPlane";}];
      block-out-from = "screencast";
    }
  ];

in {
  programs.niri.settings.window-rules = windowRules ++ floatingRules;
}
