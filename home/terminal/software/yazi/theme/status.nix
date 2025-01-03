{
  programs.yazi.theme.status = {
    separator_open = "";
    separator_close = "";
    separator_style = {
      fg = "darkgray";
      bg = "darkgray";
    };

    # Mode;
    mode_normal = {
      fg = "black";
      bg = "blue";
      bold = true;
    };
    mode_select = {
      fg = "black";
      bg = "green";
      bold = true;
    };
    mode_unset = {
      fg = "black";
      bg = "magenta";
      bold = true;
    };

    # Progress;
    progress_label = {bold = true;};
    progress_normal = {
      fg = "blue";
      bg = "black";
    };
    progress_error = {
      fg = "red";
      bg = "black";
    };

    # Permissions;
    permissions_t = {fg = "blue";};
    permissions_r = {fg = "yellow";};
    permissions_w = {fg = "red";};
    permissions_x = {fg = "green";};
    permissions_s = {fg = "darkgray";};
  };
}
